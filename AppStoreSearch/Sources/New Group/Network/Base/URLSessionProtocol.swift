//
//  URLSessionProtocol.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

protocol URLSessionProtocol {
  func data(
    for request: URLRequest,
    delegate: URLSessionTaskDelegate?
  ) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
