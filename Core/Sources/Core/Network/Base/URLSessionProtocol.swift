//
//  URLSessionProtocol.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

public protocol URLSessionProtocol {
  func data(
    for request: URLRequest,
    delegate: URLSessionTaskDelegate?
  ) async throws -> (Data, URLResponse)

  func data(
    from url: URL,
    delegate: URLSessionTaskDelegate?
  ) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
