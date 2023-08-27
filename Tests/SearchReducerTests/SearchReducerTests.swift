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
  }
}
