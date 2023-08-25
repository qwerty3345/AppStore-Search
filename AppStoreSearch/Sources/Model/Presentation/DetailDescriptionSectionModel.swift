//
//  DetailDescriptionSectionModel.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

struct DetailDescriptionSectionModel {
  let description: String
  let artistName: String

  init(from result: SearchResult) {
    self.description = result.description
    self.artistName = result.artistName
  }
}
