//
//  MainTabView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct MainTabView: View {
  var body: some View {
    TabView {
      placeholderView
        .tabItem {
          Image(systemName: "doc.text.image")
          Text("투데이")
        }

      placeholderView
        .tabItem {
          Image(systemName: "gamecontroller.fill")
          Text("게임")
        }

      placeholderView
        .tabItem {
          Image(systemName: "square.stack.3d.up.fill")
          Text("앱")
        }

      placeholderView
        .tabItem {
          Image(systemName: "square.and.arrow.down")
          Text("업데이트")
        }

      Text("")
        .tabItem {
          Image(systemName: "magnifyingglass")
          Text("검색")
        }
    }
  }

  private var placeholderView: some View {
    Text("빈 화면입니다.\n검색으로 이동 해 주세요.")
      .multilineTextAlignment(.center)
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
