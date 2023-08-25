//
//  ShareItem.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

struct ShareItem: Identifiable {
  let id: Int
  let trackName: String
  let trackViewUrl: String?

  var shareText: String {
    var text = trackName
    if let trackViewUrl {
      text += "\n\n"
      text += trackViewUrl
    }
    return text
  }
}
