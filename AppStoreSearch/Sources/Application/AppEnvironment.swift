//
//  AppEnvironment.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/27.
//

import Foundation
import Core

struct AppEnvironment {
  let container = DIContainer.shared

  func registerDependencies() {
    // Network
    container.register(type: NetworkRouterProtocol.self, NetworkRouter())

    // Services
    container.register(type: HistoryServiceProtocol.self, HistoryService())
    container.register(type: SearchServiceProtocol.self, SearchService())

    // Reducer
    container.register(type: SearchReducer.self, SearchReducer())
  }
}

extension AppEnvironment {
  /// 유닛테스트를 위한 Mock 형태의 Session을 주입
  func registerMockDependencies() {
    let mockURLSession = MockURLSession(successMockData: SearchResponse.mockRawData)
    container.register(type: NetworkRouterProtocol.self, NetworkRouter(session: mockURLSession))
  }
}
