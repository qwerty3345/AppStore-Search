//
//  SearchEndpoint.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

enum SearchEndpoint: EndPointType {
  /// 검색어 제안 (자동완성)
  case suggestion(query: String)
  /// 앱 검색
  case searchApp(query: String)

  var baseURL: URL {
    return URL(string: "https://itunes.apple.com")!
  }

  var path: String? {
    return "/search"
  }

  var httpMethod: HTTPMethod {
    return .get
  }

  var task: HTTPTask {
    switch self {
    case let .suggestion(query: query):
      let parameters: Parameters = [
        "term": query,
        "media": "software",
        "country": "KR"
      ]
      return .requestParameters(parameters)

    case let .searchApp(query: query):
      let parameters: Parameters = [
        "term": query,
        "media": "software",
        "country": "KR"
      ]
      return .requestParameters(parameters)
    }
  }

  var headers: HTTPHeaders {
    return [:]
  }
}
