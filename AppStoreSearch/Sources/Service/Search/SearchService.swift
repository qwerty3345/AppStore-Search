//
//  SearchService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

final class SearchService {

  // MARK: - Properties

  private let router: NetworkRouterProtocol

  // MARK: - Initialization

  init(router: NetworkRouterProtocol) {
    self.router = router
  }

  // MARK: - Public Methods

  func suggestion(of query: String) async throws -> [String] {
    let suggestionResponse = try await router.request(
      with: SearchEndpoint.suggestion(query: query),
      type: SuggestionResponse.self
    )

    let suggestions = suggestionResponse.results.map { $0.trackName }
    return suggestions
  }

  func search(of query: String) async throws -> [SearchResult] {
    let searchResponse = try await router.request(
      with: SearchEndpoint.searchApp(query: query),
      type: SearchResponse.self
    )

    return searchResponse.results
  }
}
