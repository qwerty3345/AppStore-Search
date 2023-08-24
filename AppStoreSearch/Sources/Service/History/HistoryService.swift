//
//  HistoryService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

protocol HistoryServiceProtocol {
  func fetchHistories() async -> [String]
  func save(history: String)
}

final class HistoryService: HistoryServiceProtocol {

  // MARK: - Properties

  @UserDefault(key: historyKey, defaultValue: [])
  private(set) var histories: [String]

  private static let historyKey: String = "History"
  private let maxCount = 20

  // MARK: - Public Methods

  @MainActor
  func fetchHistories() async -> [String] {
    return histories
  }

  func save(history: String) {
    if histories.count >= maxCount {
      let numberOfDeletion = histories.count - maxCount + 1
      histories.removeFirst(numberOfDeletion)
    }

    if let existingIndex = histories.firstIndex(of: history) {
      histories.remove(at: existingIndex)
    }

    histories.append(history)
  }
}
