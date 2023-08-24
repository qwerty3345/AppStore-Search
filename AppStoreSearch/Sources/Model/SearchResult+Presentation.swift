//
//  SearchResult+Presentation.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

extension SearchResult {
  var userRatingCountText: String {
    if userRatingCount > 10000 {
      let roundedNumber = Double(userRatingCount) / 10000.0
      let numberText = String(format: "%.1f", roundedNumber)
      return "\(numberText)만"
    }

    if self.userRatingCount > 1000 {
      let roundedNumber = Double(userRatingCount) / 1000.0
      let numberText = String(format: "%.1f", roundedNumber)
      return "\(numberText)천"
    }
    return "\(userRatingCount)"
  }

  var averageUserRatingText: String {
    averageUserRating.rounded(to: 1)
  }

  var updateDatePassedDayText: String {
    // 2017-04-09T05:56:52Z 형태 _ ISO8601 형식
    guard let date = ISO8601DateFormatter().date(from: currentVersionReleaseDate) else { return "" }
    return date.formatPassedDay()
  }
}
