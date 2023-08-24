//
//  SuggestionResponse.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

/// 추천 검색을 위한 Response
///
/// 메모리 효율을 위해 검색 시 필요한 앱 이름만 Decoding 하도록 정의함
struct SuggestionResponse: Decodable {
  let results: [Suggestion]

  struct Suggestion: Decodable {
    let trackName: String
  }
}
