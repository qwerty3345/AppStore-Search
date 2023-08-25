//
//  SearchResult+Presentation.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

extension SearchResult {




  var fileSizeByteText: String {
    let byte = Double(fileSizeBytes) ?? 0
    return byte.byteUnitText
  }
}
