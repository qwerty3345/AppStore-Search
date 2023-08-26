//
//  MockURLSession.swift
//  AppStoreSearchTests
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

#if DEBUG
public final class MockURLSession: URLSessionProtocol {

  // MARK: - Properties

  let urlSession: URLSession = {
    let configuration = URLSessionConfiguration.ephemeral
    configuration.protocolClasses = [MockURLProtocol.self]
    let urlSession = URLSession(configuration: configuration)
    return urlSession
  }()

  public let isFailRequest: Bool
  public let successMockData: Data

  public let successStatusCode = 200
  public let failureStatusCode = 410

  // MARK: - Initialization

  public init(
    isFailRequest: Bool = false,
    successMockData: Data
  ) {
    self.isFailRequest = isFailRequest
    self.successMockData = successMockData
  }

  // MARK: - Public Methods

  public func dataTaskPublisher(for url: URL) -> URLSession.DataTaskPublisher {
    let successResponse = HTTPURLResponse(
      url: url,
      statusCode: successStatusCode,
      httpVersion: "2",
      headerFields: nil)
    let failureResponse = HTTPURLResponse(
      url: url,
      statusCode: failureStatusCode,
      httpVersion: "2",
      headerFields: nil)

    let response = isFailRequest ? failureResponse : successResponse
    let data = isFailRequest ? nil : successMockData

    MockURLProtocol.requestHandler = { _ in
      return (data, response, nil)
    }

    return urlSession.dataTaskPublisher(for: url)
  }
}
#endif
