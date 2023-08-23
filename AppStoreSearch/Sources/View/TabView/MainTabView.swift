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
      ForEach(Tab.allCases, id: \.self) { tab in
        tab.view
          .tabItem {
            tab.image
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
