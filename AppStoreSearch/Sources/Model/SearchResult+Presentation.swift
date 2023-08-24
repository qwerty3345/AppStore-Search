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
}
