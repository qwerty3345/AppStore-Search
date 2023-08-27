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

      Carousel(
        items: screenshots.urls,
        index: $index,
        spacing: 10,
        trailingSpace: carouselTrailingSpace
      ) {
        RemoteImage(url: $0) { image in
          image
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
        }
        .frame(width: carouselWidth, height: carouselHeight)
      }
      .frame(height: carouselHeight)
      .padding(.bottom)
    }
  }

  // MARK: - Private

  private var isLongWidth: Bool {
    screenshots.mode == .longWidth
  }

  private var carouselWidth: CGFloat {
    isLongWidth ? screenWidth * 0.9 : screenWidth * 0.6
  }

  private var carouselHeight: CGFloat {
    carouselWidth / screenshots.mode.ratio
  }

  private var carouselTrailingSpace: CGFloat {
    isLongWidth ? 40 : 140
  }
}

struct DetailReleaseSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailScreenShotSection(screenshots: .init(from: .mock))
      .previewLayout(.sizeThatFits)
  }
}
