//
//  EndPointType.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: String]

public protocol EndPointType {
  var baseURL: URL { get }
  var path: String? { get }
  var httpMethod: HTTPMethod { get }
  var task: HTTPTask { get }
  var headers: HTTPHeaders { get }

  func buildURLRequest() -> URLRequest
}

// MARK: - build URLRequest 기본구현

extension EndPointType {
  public func buildURLRequest() -> URLRequest {
    var url: URL = baseURL
    url.appendPathComponent(path ?? "")

    var request = URLRequest(url: url)
    request.httpMethod = httpMethod.rawValue
    request.allHTTPHeaderFields = headers

    if case let .requestParameters(parameters) = task {
      let queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
      request.url?.append(queryItems: queryItems)
    }

    return request
  }
}
