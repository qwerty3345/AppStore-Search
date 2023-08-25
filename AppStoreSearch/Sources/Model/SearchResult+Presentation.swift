//
//  SearchResult+Presentation.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

extension SearchResult {


  var updateDatePassedDayText: String {
    // 2017-04-09T05:56:52Z 형태 _ ISO8601 형식
    guard let date = ISO8601DateFormatter().date(from: currentVersionReleaseDate) else { return "" }
    return date.formatPassedDay()
  }

  var fileSizeByteText: String {
    let byte = Double(fileSizeBytes) ?? 0
    return byte.byteUnitText
  }
}
