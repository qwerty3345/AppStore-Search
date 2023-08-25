//
//  NetworkRouter.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

public protocol NetworkRouterProtocol: AnyObject {
  func request<T: Decodable>(with endPoint: EndPointType, type: T.Type) async throws -> T
}

/// Concurrency 를 활용한 Network Router
public final class NetworkRouter: NetworkRouterProtocol {

  // MARK: - Properties

  private let session: URLSessionProtocol
  private let decoder = JSONDecoder()

  // MARK: - Initialization

  public init(session: URLSessionProtocol = URLSession.shared) {
    self.session = session
  }

  // MARK: - Public Methods

  public func request<T: Decodable>(with endPoint: EndPointType, type: T.Type) async throws -> T {
    let urlRequest = try endPoint.buildURLRequest()
    let (data, response) = try await session.data(for: urlRequest, delegate: nil)

    guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode else { throw NetworkError.invalidStatusCode }

    let decodedData = try decoder.decode(T.self, from: data)

    return decodedData
  }

  public func requestData(with url: URL) async throws -> Data {
    let (data, response) = try await session.data(from: url, delegate: nil)

    guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode else { throw NetworkError.invalidStatusCode }

    return data
  }
}
