//
//  DetailInformationSectionModel.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

struct DetailInformationSectionModel {
  let artistName: String
  let firstGenre: String
  let contentAdvisoryRating: String
  private let fileSizeBytes: String

  init(from result: SearchResult) {
    self.artistName = result.artistName
    self.fileSizeBytes = result.fileSizeBytes
    self.firstGenre = result.genres.first ?? ""
    self.contentAdvisoryRating = result.contentAdvisoryRating
  }

  var fileSizeByteText: String {
    let byte = Double(fileSizeBytes) ?? 0
    return byte.byteUnitText
  }
}
