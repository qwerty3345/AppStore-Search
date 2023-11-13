//
//  MainTab+ChildView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/27.
//

import SwiftUI
import ComposableArchitecture

extension MainTab {
  @ViewBuilder
  var view: some View {
    switch self {
    case .today: placeholderView
    case .game: placeholderView
    case .app: placeholderView
    case .arcade: placeholderView
    case .search: SearchView(
      store: StoreOf<SearchReducer>.init(initialState: SearchReducer.initialState, reducer: {
        SearchReducer()
      })
    )
    }
  }

  private var placeholderView: some View {
    Text("빈 화면입니다.\n검색으로 이동 해 주세요.")
      .multilineTextAlignment(.center)
  }
}
