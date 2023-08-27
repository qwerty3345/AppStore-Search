//
//  MainTabView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct MainTabView: View {
  @State private var selectedTabIndex = MainTab.search.rawValue

  var body: some View {
    TabView(selection: $selectedTabIndex) {
      ForEach(MainTab.allCases, id: \.self) { tab in
        tab.view
          .tabItem {
            Image(systemName: tab.systemImageName)
            Text(tab.title)
          }
          .tag(tab.rawValue)
      }
      .toolbarBackground(.visible, for: .tabBar)
    }
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
