//
//  SearchResultView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct SearchResultView: View {
  @Binding var searchResults: [SearchResult]

  var body: some View {
    // TODO: 검색 결과가 없을 때 나타내기
    List(searchResults) { result in
      VStack {
        header(of: result)
        screenShotView(of: result)
      }
      .overlay( // 네비게이션 링크의 ">" 를 지우기 위해 overlay로 처리
        NavigationLink(value: result, label: {})
          .opacity(0.0)
      )
      .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
  }

  private func header(of result: SearchResult) -> some View {
    HStack {
      RemoteImage(url: result.artworkUrl60) { image in
        image
          .cornerRadius(8)
      }
      .frame(width: 64, height: 64)

      VStack(alignment: .leading, spacing: 4) {
        Text(result.trackName)
          .font(.body)
          .lineLimit(1)

        Text(result.genres.first ?? "")
          .font(.caption)
          .foregroundColor(.gray.opacity(0.2))
      }

      Spacer()

      Button {

      } label: {
        Text("받기")
          .foregroundColor(.blue)
          .fontWeight(.bold)
          .frame(width: 80, height: 32)
          .background(.gray.opacity(0.2))
          .cornerRadius(16)
      }
    }
  }

  private func screenShotView(of result: SearchResult) -> some View {
    return ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        let isLongWidth = result.screenShotMode == .longWidth

        let shortSideSize = UIScreen.main.bounds.width / 3 - 16
        let longSideSize = isLongWidth ?
        shortSideSize * result.screenShotMode.ratio :
        shortSideSize / result.screenShotMode.ratio

        let width = isLongWidth ? longSideSize : shortSideSize
        let height = isLongWidth ? shortSideSize : longSideSize

        ForEach(result.screenshotUrls.prefix(3), id: \.self) {
          RemoteImage(url: $0) { image in
            image
              .resizable()
              .cornerRadius(8)
              .aspectRatio(contentMode: .fit)
          } placeHolderView: {
            RoundedRectangle(cornerRadius: 8)
              .fill(.gray)
          }
          .frame(width: width, height: height)
        }
      }
    }
    .scrollDisabled(result.screenShotMode == .longHeight)
  }
}

struct SearchResultView_Previews: PreviewProvider {
  static var previews: some View {
    SearchResultView(
      searchResults: .constant(SearchResponse.mock.results)
    )
  }
}
