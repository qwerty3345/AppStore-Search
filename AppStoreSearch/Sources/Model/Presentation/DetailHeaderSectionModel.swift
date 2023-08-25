//
//  DetailHeaderSectionModel.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

struct DetailHeaderSectionModel {
  let artworkUrl100: URL?
  let trackName: String
  let artistName: String
  let id: Int
  let trackViewUrl: String?

  init(from result: SearchResult) {
    self.artworkUrl100 = result.artworkUrl100
    self.trackName = result.trackName
    self.artistName = result.artistName
    self.id = result.trackId
    self.trackViewUrl = result.trackViewUrl
  }

  func toShareItem() -> ShareItem {
    ShareItem(
      id: id,
      trackName: trackName,
      trackViewUrl: trackViewUrl
    )
  }
}
