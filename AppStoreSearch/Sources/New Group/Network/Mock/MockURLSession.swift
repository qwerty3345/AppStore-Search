//
//  MockURLSession.swift
//  AppStoreSearchTests
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

#if DEBUG
final class MockURLSession: URLSessionProtocol {

  // MARK: - Properties

  let urlSession: URLSession = {
    let configuration = URLSessionConfiguration.ephemeral
    configuration.protocolClasses = [MockURLProtocol.self]
    let urlSession = URLSession(configuration: configuration)
    return urlSession
  }()

  let isFailRequest: Bool
  let successMockData: Data

  let successStatusCode = 200
  let failureStatusCode = 410

  // MARK: - Initialization

  init(
    isFailRequest: Bool = false,
    successMockData: Data = SearchResponse.mockRawData
  ) {
    self.isFailRequest = isFailRequest
    self.successMockData = successMockData
  }

  // MARK: - Public Methods

  func data(
    for request: URLRequest,
    delegate: URLSessionTaskDelegate?
  ) async throws -> (Data, URLResponse) {
    return try await data(from: request.url!, delegate: nil)
  }

  func data(
    from url: URL,
    delegate: URLSessionTaskDelegate?
  ) async throws -> (Data, URLResponse) {
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

    return try await urlSession.data(from: url)
  }
}
#endif
