//
//  NetworkRouterTests.swift
//  AppStoreSearchTests
//
//  Created by Mason Kim on 2023/08/24.
//

import XCTest
@testable import AppStoreSearch
import Core

final class NetworkRouterTests: XCTestCase {

  var sut: NetworkRouter!

  override func setUpWithError() throws {
    sut = NetworkRouter(
      session:
        MockURLSession(
          successMockData: SearchResponse.mockRawData
        )
    )
  }

  override func tearDownWithError() throws {
    sut = nil
  }

  func test_Search_결과가_비어있지_않다() async throws {
    let searchResponse = try await sut.request(
      with: SearchEndpoint.searchApp(query: "health"),
      type: SearchResponse.self
    )

    XCTAssertFalse(searchResponse.results.isEmpty)
  }
}
