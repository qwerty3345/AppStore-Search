//
//  SearchService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation
import Core
import Combine

protocol SearchServiceProtocol {
  /// countLimit 최대 200
  func search(of query: String, countLimit: Int) -> AnyPublisher<[SearchResult], Error>
}

struct SearchService: SearchServiceProtocol {

  // MARK: - Properties

  @Inject private var router: NetworkRouterProtocol

  // MARK: - Public Methods

  func search(of query: String, countLimit: Int) -> AnyPublisher<[SearchResult], Error> {
    return router.request(
      with: SearchEndpoint.searchApp(query: query, countLimit: min(countLimit, 200)),
      type: SearchResponse.self
    )
    .map { $0.results }
    .eraseToAnyPublisher()
  }
}
