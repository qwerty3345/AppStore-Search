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

  init(from searchResult: SearchResult) {
    self.artworkUrl100 = searchResult.artworkUrl100
    self.trackName = searchResult.trackName
    self.artistName = searchResult.artistName
    self.id = searchResult.trackId
    self.trackViewUrl = searchResult.trackViewUrl
  }

  func toShareItem() -> ShareItem {
    ShareItem(
      id: id,
      trackName: trackName,
      trackViewUrl: trackViewUrl
    )
  }
}
