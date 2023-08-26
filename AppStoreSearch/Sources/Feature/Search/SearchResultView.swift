//
//  SearchResultView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI
import Core

struct SearchResultView: View {
  let results: [SearchResult]
  @EnvironmentObject var store: StoreOf<SearchReducer>

  var body: some View {
    List {
      ForEach(results) { result in
        VStack {
          header(with: result)
          screenShotView(with: .init(from: result))
        }
        .overlay( // 네비게이션 링크의 ">" 를 지우기 위해 overlay로 처리
          NavigationLink(value: result, label: {})
            .opacity(0.0)
        )
        .listRowSeparator(.hidden)
      }

      if !results.isEmpty && !store.state.isLimit {
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
    .listStyle(.plain)
  }

  private func header(with result: SearchResult) -> some View {
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

  private func screenShotView(with screenShots: ScreenShots) -> some View {
    let isLongWidth = screenShots.mode == .longWidth

    return ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        let ratio = screenShots.mode.ratio

        let shortSideSize = UIScreen.main.bounds.width / 3 - 20
        let longSideSize = isLongWidth
        ? shortSideSize * ratio
        : shortSideSize / ratio

        let width = isLongWidth ? longSideSize : shortSideSize
        let height = isLongWidth ? shortSideSize : longSideSize

        ForEach(screenShots.urls.prefix(3), id: \.self) {
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
    .scrollDisabled(!isLongWidth)
  }
}

struct SearchResultView_Previews: PreviewProvider {
  static var previews: some View {
    SearchResultView(
      results: Array(SearchResponse.mock.results.prefix(3))
    )
    .environmentObject(
      Store(reducer: SearchReducer(
        searchService: SearchService(
          router: NetworkRouter()
        ),
        historyService: HistoryService()
      ))
    )
  }
}
