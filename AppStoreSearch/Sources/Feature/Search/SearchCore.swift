//
//  SearchCore.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/26.
//

import Foundation
import Core
import Combine

final class SearchReducer: ReducerProtocol {

  // MARK: - State, Action

  struct State {
    var searchText: String = ""
    var countLimit: Int = searchCountLimitUnit
    var showingState: ShowingState = .searching
    var searchResults: [SearchResult] = []
    var suggestions: [String] = []
    var histories: [String] = []

    var isLimit: Bool {
      countLimit >= searchCountMaxLimit
    }
  }

  enum Action {
    case onAppear
    case change(searchText: String)
    case search
    case selectToSearch(text: String)
    case loadMore
    case fetchComplete(results: [SearchResult])
    case fetchError
  }

  // MARK: - Properties

  let initialState: State = .init()

  @Inject private var searchService: SearchServiceProtocol
  @Inject private var historyService: HistoryServiceProtocol

  private static let searchCountLimitUnit: Int = 20
  private static let searchCountMaxLimit: Int = 200

  // MARK: - Public Methods

  func reduce(state: inout State, action: Action) -> Effect {
    switch action {
    case .onAppear:
      state.histories = historyService.fetchHistories()

    case let .change(searchText: searchText):
      changeTextAction(&state, searchText: searchText)

    case .search:
      if let effect = searchAction(&state) {
        return effect
      }

    case .loadMore:
      guard state.countLimit < Self.searchCountMaxLimit else { break }
      return searchServiceEffect(state)

    case let .fetchComplete(results: results):
      fetchCompleteAction(&state, results: results)

    case let .selectToSearch(text: text):
      state.searchText = text
      return .publisher(
        Just(.search).eraseToAnyPublisher()
      )

    case .fetchError:
      state.showingState = .showingError
    }
    
    return .none
  }

  // MARK: - Private Methods

  private func changeTextAction(_ state: inout State, searchText: String) {
    state.searchText = searchText
    state.showingState = .searching
    state.searchResults = []
    state.countLimit = Self.searchCountLimitUnit

    state.suggestions = state.histories.filter {
      $0.contains(searchText)
    }
  }

  private func searchAction(_ state: inout State) -> Effect? {
    guard state.showingState != .loading,
          !state.searchText.isEmpty else { return nil }
    let keyword = state.searchText

    historyService.save(history: keyword)
    state.histories = historyService.fetchHistories()
    state.showingState = .loading

    return searchServiceEffect(state)
  }

  private func searchServiceEffect(_ state: State) -> Effect {
    let keyword = state.searchText
    return .publisher(
      searchService.search(of: keyword, countLimit: state.countLimit)
        .map { results in
          Action.fetchComplete(results: results)
        }
        .catch { error in
          Just(Action.fetchError)
        }
        .eraseToAnyPublisher()
    )
  }

  private func fetchCompleteAction(_ state: inout State, results: [SearchResult]) {
    guard !results.isEmpty else {
      state.showingState = .showingEmpty
      return
    }

    state.countLimit += Self.searchCountLimitUnit
    state.searchResults = results
    state.showingState = .showingResult
  }
}

// MARK: - ShowingState

extension SearchReducer.State {
  enum ShowingState {
    case searching
    case loading
    case showingError
    case showingResult
    case showingEmpty
  }
}
