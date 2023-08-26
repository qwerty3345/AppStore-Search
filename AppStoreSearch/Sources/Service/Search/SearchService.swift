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
  func search(of query: String) -> AnyPublisher<[SearchResult], Error>
}

struct SearchService: SearchServiceProtocol {

  // MARK: - Properties

  private let router: NetworkRouterProtocol

  // MARK: - Initialization

  init(router: NetworkRouterProtocol) {
    self.router = router
  }

  // MARK: - Public Methods

  func search(of query: String) -> AnyPublisher<[SearchResult], Error> {
    return router.request(
      with: SearchEndpoint.searchApp(query: query),
      type: SearchResponse.self
    )
    .map { $0.results }
    .eraseToAnyPublisher()
  }
}
