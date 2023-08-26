//
//  URLSessionProtocol.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

public protocol URLSessionProtocol {
  func dataTaskPublisher(for url: URL) -> URLSession.DataTaskPublisher
}

extension URLSession: URLSessionProtocol { }
