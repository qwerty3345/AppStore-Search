//
//  Tab.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

enum Tab: CaseIterable {
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

  var image: Image {
    switch self {
    case .today: return Image(systemName: "doc.text.image")
    case .game: return Image(systemName: "gamecontroller")
    case .app: return Image(systemName: "square.stack.3d.up.fill")
    case .arcade: return Image(systemName: "figure.play")
    case .search: return Image(systemName: "magnifyingglass")
    }
  }

  @ViewBuilder
  var view: some View {
    switch self {
    case .today: placeholderView
    case .game: placeholderView
    case .app: placeholderView
    case .arcade: placeholderView
    case .search: SearchView()
    }
  }

  private var placeholderView: some View {
    Text("빈 화면입니다.\n검색으로 이동 해 주세요.")
      .multilineTextAlignment(.center)
  }
}
