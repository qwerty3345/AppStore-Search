//
//  MockHistoryService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/27.
//

import Foundation

final class MockHistoryService: HistoryServiceProtocol {
  var mockHistories: [String] = []

  func fetchHistories() -> [String] {
    return mockHistories
  }

  func save(history: String) {
    mockHistories.append(history)
  }
}
