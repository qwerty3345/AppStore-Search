//
//  SearchService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation
import Core

protocol SearchServiceProtocol {
  func search(of query: String) async throws -> [SearchResult]
}

struct SearchService: SearchServiceProtocol {

  // MARK: - Properties

  private let router: NetworkRouterProtocol

  // MARK: - Initialization

  init(router: NetworkRouterProtocol) {
    self.router = router
  }

  // MARK: - Public Methods

  func search(of query: String) async throws -> [SearchResult] {
    let searchResponse = try await router.request(
      with: SearchEndpoint.searchApp(query: query),
      type: SearchResponse.self
    )

    return searchResponse.results
  }
}
