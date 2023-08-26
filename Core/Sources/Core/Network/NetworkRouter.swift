//
//  NetworkRouter.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation
import Combine

public protocol NetworkRouterProtocol: AnyObject {
  func request<T: Decodable>(with endPoint: EndPointType, type: T.Type) -> AnyPublisher<T, Error>
}

/// Combine 을 활용한 Network Router
public final class NetworkRouter: NetworkRouterProtocol {

  // MARK: - Properties

  private let session: URLSessionProtocol
  private let decoder = JSONDecoder()

  // MARK: - Initialization

  public init(session: URLSessionProtocol = URLSession.shared) {
    self.session = session
  }

  // MARK: - Public Methods

  public func request<T: Decodable>(with endPoint: EndPointType, type: T.Type) -> AnyPublisher<T, Error> {
    let urlRequest = endPoint.buildURLRequest()

    return requestData(with: urlRequest.url!)
      .decode(type: T.self, decoder: decoder)
      .eraseToAnyPublisher()
  }

  public func requestData(with url: URL) -> AnyPublisher<Data, Error> {
    return session.dataTaskPublisher(for: url)
      .tryMap { data, response in
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
          throw NetworkError.invalidStatusCode
        }
        return data
      }
      .eraseToAnyPublisher()
  }
}
