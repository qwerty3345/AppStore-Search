//
//  SearchResponse.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

struct SearchResponse: Decodable {
  let resultCount: Int
  let results: [SearchResult]
}
