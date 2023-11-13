//
//  HistoryService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation
import Core
import Dependencies

protocol HistoryServiceProtocol {
  func fetchHistories() -> [String]
  func save(history: String)
}

final class HistoryService: HistoryServiceProtocol {

  // MARK: - Properties

  @UserDefault(key: historyKey, defaultValue: [])
  private(set) var histories: [String]

  private static let historyKey: String = "History"
  private let maxCount = 20

  // MARK: - Public Methods

  func fetchHistories() -> [String] {
    return histories
  }

  func save(history: String) {
    if histories.count >= maxCount {
      let numberOfDeletion = histories.count - maxCount + 1
      histories.removeLast(numberOfDeletion)
    }

    if let existingIndex = histories.firstIndex(of: history) {
      histories.remove(at: existingIndex)
    }

    histories.insert(history, at: 0)
  }
}

extension HistoryService: DependencyKey {
  static var liveValue: HistoryService = HistoryService()
}

extension DependencyValues {
  var historyService: HistoryService {
    get { self[HistoryService.self] }
    set { self[HistoryService.self] = newValue }
  }
}
