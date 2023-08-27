//
//  SearchResultView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI
import Core

struct SearchResultView: View {

  // MARK: - Properties

  let results: [SearchResult]
  @EnvironmentObject var store: StoreOf<SearchReducer>

  // MARK: - Body

  var body: some View {
    List {
      ForEach(results) { result in
        VStack {
          SearchResultHeaderView(result: result)

          SearchResultScreenShotView(
            screenShots: .init(from: result)
          )
        }
        .overlay(
          // 네비게이션 링크의 ">" 를 지우기 위해 overlay로 처리
          NavigationLink(value: result, label: {})
            .opacity(0.0)
        )
        .listRowSeparator(.hidden)
      }

      if !results.isEmpty && !store.state.isLimit {
        bottomProgressView
      }
    }
    .listStyle(.plain)
  }

  // MARK: - Private

  private var bottomProgressView: some View {
    HStack {
      Spacer()
      ProgressView()
        .id(UUID()) // 여러번 페이징 후 사라지는 현상 해결
        .progressViewStyle(.circular)
        .onAppear {
          store.dispatch(.loadMore)
        }
      Spacer()
    }
  }
}

// MARK: - SearchResultHeaderView

struct SearchResultHeaderView: View {
  let result: SearchResult

  var body: some View {
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

      DownloadButton(action: {})
    }
  }
}

// MARK: - SearchResultScreenShotView

struct SearchResultScreenShotView: View {
  let screenShots: ScreenShots

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        ForEach(screenShots.urls.prefix(3), id: \.self) {
          ResultScreenShotImageView(
            url: $0,
            width: imageWidth,
            height: imageHeight
          )
        }
      }
    }
    .scrollDisabled(!screenShots.isLongWidth)
  }

  private let shortSideSize = screenWidth / 3 - 20

  private var imageWidth: CGFloat {
    return screenShots.isLongWidth ?
    shortSideSize * screenShots.mode.ratio :
    shortSideSize
  }

  private var imageHeight: CGFloat {
    return screenShots.isLongWidth ?
    shortSideSize :
    shortSideSize / screenShots.mode.ratio
  }
}

// MARK: - ResultScreenShotImageView

struct ResultScreenShotImageView: View {
  let url: URL
  let width: CGFloat
  let height: CGFloat

  var body: some View {
    RemoteImage(url: url) { image in
      image
        .resizable()
        .cornerRadius(8)
        .aspectRatio(contentMode: .fit)
    } placeHolderView: {
      RoundedRectangle(cornerRadius: 8)
        .fill(Color.gray)
    }
    .frame(width: width, height: height)
  }
}

// MARK: - Preview

struct SearchResultView_Previews: PreviewProvider {
  static var previews: some View {
    SearchResultView(
      results: Array(SearchResponse.mock.results.prefix(3))
    )
    .environmentObject(
      Store(reducer: SearchReducer())
    )
  }
}
