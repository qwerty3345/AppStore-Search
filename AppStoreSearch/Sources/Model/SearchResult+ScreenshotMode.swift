//
//  ScreenshotMode.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

extension SearchResult {
  var screenShotMode: ScreenShotMode {
    guard let screenShotURL = screenshotUrls.first else { return .none }
    return ScreenShotMode(screenShotURL: screenShotURL)
  }
}

enum ScreenShotMode {
  case longHeight
  case longWidth
  case none

  init(screenShotURL: URL) {
    let screenShotURLString = screenShotURL.absoluteString

    if screenShotURLString.contains("392x696") {
      self = .longHeight
      return
    }

    if screenShotURLString.contains("406x228") {
      self = .longWidth
      return
    }

    self = .none
  }

  var ratio: CGFloat {
    switch self {
    case .longHeight: return 392.0 / 696.0
    case .longWidth: return 406.0 / 228.0
    case .none: return 1.0
    }
  }
}
