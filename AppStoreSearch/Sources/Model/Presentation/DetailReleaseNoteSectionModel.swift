//
//  DetailReleaseNoteSectionModel.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

struct DetailReleaseNoteSectionModel {
  let version: String
  let releaseNotes: String?
  private let currentReleaseDate: String

  init(from result: SearchResult) {
    self.version = result.version
    self.releaseNotes = result.releaseNotes
    self.currentReleaseDate = result.currentVersionReleaseDate
  }

  var updateDatePassedDayText: String {
    // 2017-04-09T05:56:52Z 형태 _ ISO8601 형식
    guard let date = ISO8601DateFormatter().date(from: currentReleaseDate) else { return "" }
    return date.formatPassedDay()
  }
}
