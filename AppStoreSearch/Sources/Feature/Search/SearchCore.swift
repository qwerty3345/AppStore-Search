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
    var showingState: ShowingState = .searching
    var searchResults: [SearchResult] = []
    var suggestions: [String] = []
    var histories: [String] = []
  }

  enum Action {
    case onAppear
    case change(keyword: String)
    case search(keyword: String)
    case select(suggestion: String)
    case fetchComplete(results: [SearchResult])
    case fetchError
  }

  // MARK: - Properties

  let initialState: State = .init()

  let searchService: SearchServiceProtocol
  let historyService: HistoryServiceProtocol

  private var cancellables = Set<AnyCancellable>()

  // MARK: - Initialization

  init(
    searchService: SearchServiceProtocol,
    historyService: HistoryServiceProtocol
  ) {
    self.searchService = searchService
    self.historyService = historyService
  }

  // MARK: - Public Methods

  func reduce(state: inout State, action: Action) -> Effect {
    switch action {
    case .onAppear:
      state.histories = historyService.fetchHistories()

    case let .change(keyword: keyword):
      state.showingState = .searching

      state.suggestions = state.histories.filter {
        $0.contains(keyword)
      }

    case let .search(keyword: keyword):
      historyService.save(history: keyword)
      state.histories = historyService.fetchHistories()

      return .publisher(
        searchService.search(of: keyword)
          .map { results in
            Action.fetchComplete(results: results)
          }
          .catch { error in
            Just(Action.fetchError)
          }
          .eraseToAnyPublisher()
      )

    case let .fetchComplete(results: results):
      state.searchResults = results
      state.showingState = .showingResult

    case let .select(suggestion: suggestion):
      return .publisher(
        Just(.search(keyword: suggestion))
          .eraseToAnyPublisher()
      )

    default:
      break
    }
    
    return .none
  }
}


extension SearchReducer.State {
  enum ShowingState {
    case searching
    case loading
    case showingError
    case showingResult
  }
}
