//
//  DetailHorizontalInfoSectionModel.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

struct DetailHorizontalInfoSectionModel {
  let averageUserRating: Double
  let userRatingCount: Int
  let contentAdvisoryRating: String
  let firstGenre: String
  let artistName: String

  init(from result: SearchResult) {
    self.userRatingCount = result.userRatingCount
    self.averageUserRating = result.averageUserRating
    self.contentAdvisoryRating = result.contentAdvisoryRating
    self.firstGenre = result.genres.first ?? ""
    self.artistName = result.artistName
  }

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
