//
//  AppDetailReleaseSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct AppDetailScreenShotSection: View {
  let result: SearchResult

  var body: some View {
    GeometryReader { geometry in
      let width = geometry.size.width * 0.6

      ScrollView(.horizontal) {
        LazyHStack {
          ForEach(result.screenshotUrls, id: \.self) {
            AsyncImage(url: $0) { image in
              image
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .frame(width: width)
            } placeholder: {
              RoundedRectangle(cornerRadius: 8)
                .fill(.gray)
                .frame(width: width)
                .aspectRatio(Constants.screenShotRatio, contentMode: .fit)
            }
          }
        }
      }
    }
  }
}

struct AppDetailReleaseSection_Previews: PreviewProvider {
  static var previews: some View {
    AppDetailScreenShotSection(result: .mock)
  }
}
