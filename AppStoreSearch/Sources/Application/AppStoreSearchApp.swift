//
//  AppStoreSearchApp.swift
//  ios-itunes-search
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

@main
struct ios_itunes_searchApp: App {
  init() {
    AppEnvironment().registerDependencies()
  }

  var body: some Scene {
    WindowGroup {
      MainTabView()
    }
  }
}
