//
//  SearchResponse+Mock.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

#if DEBUG
extension SearchResponse {
  static let mock: SearchResponse = {
    let location = Bundle.main.url(forResource: "search_response_mock", withExtension: "json")!
    let data = try! Data(contentsOf: location)
    return try! JSONDecoder().decode(SearchResponse.self, from: data)
  }()
}

extension SearchResult {
  static let mock = SearchResponse.mock.results.first!
}
#endif
