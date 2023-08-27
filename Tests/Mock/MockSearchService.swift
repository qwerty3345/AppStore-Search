//
//  MockSearchService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/27.
//

import Foundation
import Combine

final class MockSearchService: SearchServiceProtocol {
  var mockSearchResults: [SearchResult] = SearchResponse.mock.results

  func search(of query: String, countLimit: Int) -> AnyPublisher<[SearchResult], Error> {
    return Just(mockSearchResults)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
