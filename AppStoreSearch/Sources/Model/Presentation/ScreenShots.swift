//
//  ScreenShots.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

struct ScreenShots {
  let urls: [URL]

  init(urls: [URL]) {
    self.urls = urls
  }

  init(from result: SearchResult) {
    self.urls = result.screenshotUrls
  }
}

// MARK: - 스크린샷 비율 관련 로직

extension ScreenShots {
  var mode: ScreenShotMode {
    guard let screenShotURL = urls.first else { return .none }
    return ScreenShotMode(screenShotURL: screenShotURL)
  }

  var isLongWidth: Bool {
    mode == .longWidth
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
