//
//  AppDetailReleaseSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailScreenShotSection: View {
  let result: SearchResult

  var body: some View {
    VStack {
      Text("미리보기")
        .font(.title2)
        .fontWeight(.bold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
      
      GeometryReader { geometry in
        let width = geometry.size.width * 0.6
        
        // FIXME: 절반만 드러나는 형태로 Pagination 할 수 있게 수정 필요
        
        TabView {
          ForEach(result.screenshotUrls, id: \.self) {
            RemoteImage(url: $0) { image in
              image
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
            }
            .frame(width: width)
            .aspectRatio(
              result.screenShotMode.ratio,
              contentMode: .fit
            )
          }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
      }
    }
  }
}

struct DetailReleaseSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailScreenShotSection(result: .mock)
  }
}
