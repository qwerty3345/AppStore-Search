//
//  AppDetailView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct AppDetailView: View {
  let result: SearchResult

  var body: some View {
    VStack {
      AppDetailHeaderSection(result: result)
        .padding(.bottom)

      Divider().padding(.horizontal)

      AppDetailInfoSection(result: result)

      AppDetailScreenShotSection(result: result)
    }

  }
}

struct AppDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AppDetailView(result: .mock)
  }
}
