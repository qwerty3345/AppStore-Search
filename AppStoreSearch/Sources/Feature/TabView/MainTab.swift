//
//  MainTab.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

enum MainTab: CaseIterable {
  case today
  case game
  case app
  case arcade
  case search

  var title: String {
    switch self {
    case .today: return "투데이"
    case .game: return "게임"
    case .app: return "앱"
    case .arcade: return "Arcade"
    case .search: return "검색"
    }
  }

  var systemImageName: String {
    switch self {
    case .today: return "doc.text.image"
    case .game: return "gamecontroller"
    case .app: return "square.stack.3d.up.fill"
    case .arcade: return "figure.play"
    case .search: return "magnifyingglass"
    }
  }

}
