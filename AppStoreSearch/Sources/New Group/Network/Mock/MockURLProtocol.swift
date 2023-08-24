//
//  MockURLProtocol.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

#if DEBUG
final class MockURLProtocol: URLProtocol {

  typealias RequestHandler = ((URLRequest) -> (Data?, HTTPURLResponse?, Error?))
  static var requestHandler: RequestHandler?

  override class func canInit(with request: URLRequest) -> Bool {
    return true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    return request
  }

  override func startLoading() {
    guard let handler = MockURLProtocol.requestHandler else {
      return
    }

    let (data, response, error) = handler(request)

    if let error = error {
      client?.urlProtocol(self, didFailWithError: error)
    }

    if let response = response {
      client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
    }

    if let data = data {
      client?.urlProtocol(self, didLoad: data)
    }

    client?.urlProtocolDidFinishLoading(self)
  }

  override func stopLoading() { }
}
#endif
