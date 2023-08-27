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
      ForEach(MainTab.allCases, id: \.self) { tab in
        tab.view
          .tabItem {
            Image(systemName: tab.systemImageName)
            Text(tab.title)
          }
      }
    }
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
