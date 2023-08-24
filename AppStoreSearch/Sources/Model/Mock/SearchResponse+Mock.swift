//
//  SearchResponse+Mock.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

#if DEBUG
extension SearchResponse {
  static let mockRawData: Data! = {
    let location = Bundle.main.url(forResource: "search_response_mock", withExtension: "json")!
    return try! Data(contentsOf: location)
  }()

  static let mock: SearchResponse = {
    return try! JSONDecoder().decode(SearchResponse.self, from: Self.mockRawData)
  }()
}

extension SearchResult {
  static let mock = SearchResponse.mock.results.last!
}
#endif
