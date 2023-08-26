//
//  AppDetailReleaseSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailScreenShotSection: View {
  let screenshots: ScreenShots
  @State private var index = 0

  var body: some View {
    VStack {
      Text("미리보기")
        .font(.title2)
        .fontWeight(.bold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
      
      let isLongWidth = screenshots.mode == .longWidth
      let screenWidth = UIScreen.main.bounds.width
      let width = isLongWidth ? screenWidth * 0.9 : screenWidth * 0.6
      let height = width / screenshots.mode.ratio

      Carousel(
        items: screenshots.urls,
        index: $index,
        spacing: 10,
        trailingSpace: isLongWidth ? 40 : 140
      ) {
        RemoteImage(url: $0) { image in
          image
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
        }
        .frame(width: width, height: height)
      }
      .frame(height: height)
      .padding(.bottom)
    }
  }
}

struct DetailReleaseSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailScreenShotSection(screenshots: .init(from: .mock))
      .previewLayout(.sizeThatFits)
  }
}
