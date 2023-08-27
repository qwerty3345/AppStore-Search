//
//  SearchReducerTests.swift
//  SearchReducerTests
//
//  Created by Mason Kim on 2023/08/27.
//

import XCTest
import Core
@testable import AppStoreSearch

final class SearchReducerTests: XCTestCase {

  var historyService: MockHistoryService!
  var searchService: MockSearchService!
  var reducer: SearchReducer!
  var store: StoreOf<SearchReducer>!

  override func setUpWithError() throws {
    historyService = MockHistoryService()
    searchService = MockSearchService()

    AppEnvironment().registerMockDependencies()
    DIContainer.shared.register(
      type: HistoryServiceProtocol.self,
      historyService
    )
    DIContainer.shared.register(
      type: SearchServiceProtocol.self,
      searchService
    )

    reducer = SearchReducer()
    store = Store(reducer: reducer)
  }

  override func tearDownWithError() throws {
    historyService = nil
    searchService = nil
    reducer = nil
    store = nil
  }

  func test_onAppear가_호출되면_히스토리를_불러온다() {
    historyService.mockHistories = ["apple", "banana"]
    store.dispatch(.onAppear)
    XCTAssertEqual(store.state.histories, ["apple", "banana"])
  }

  func test_change가_호출되면_검색텍스트를_변경하고_상태를_검색중으로_변경한다() {
    let searchText = "apple"
    store.dispatch(.change(searchText: searchText))

    XCTAssertEqual(store.state.searchText, searchText)
    XCTAssertEqual(store.state.showingState, .searching)
  }

  func test_fetchComplete가_호출되면_검색결과를_저장하고_상태를_결과보여주기로_변경한다() {
    let results = searchService.mockSearchResults
    store.dispatch(.fetchComplete(results: results))

    XCTAssertEqual(store.state.searchResults, results)
    XCTAssertEqual(store.state.showingState, .showingResult)
  }
}
