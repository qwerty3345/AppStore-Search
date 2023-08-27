//
//  NetworkRouterTests.swift
//  AppStoreSearchTests
//
//  Created by Mason Kim on 2023/08/24.
//

import XCTest
@testable import AppStoreSearch
import Core
import Combine

final class NetworkRouterTests: XCTestCase {

  @Inject var sut: NetworkRouter
  private var cancellable: AnyCancellable!

  override func setUpWithError() throws {
    AppEnvironment().registerMockDependencies()
  }

  override func tearDownWithError() throws {
    cancellable.cancel()
    cancellable = nil
  }

  func test_Search_결과가_비어있지_않다() throws {
    let expectation = XCTestExpectation()

    cancellable = sut.request(
      with: SearchEndpoint.searchApp(query: "health", countLimit: 20),
      type: SearchResponse.self
    ).sink { error in
      XCTFail("에러 발생")
    } receiveValue: { response in
      expectation.fulfill()
      XCTAssertFalse(response.results.isEmpty)
    }
  }
}
