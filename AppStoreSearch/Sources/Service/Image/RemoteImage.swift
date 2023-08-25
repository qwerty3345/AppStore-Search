//
//  RemoteImage.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import SwiftUI

struct RemoteImage<
  ImageView: View,
  PlaceHolderView: View,
  ErrorView: View
>: View {

  // MARK: - Properties

  private let url: URL?
  private let errorView: (Error) -> ErrorView?
  private let imageView: (Image) -> ImageView
  private let placeHolderView: () -> PlaceHolderView?

  @ObservedObject private var service = RemoteImageService()

  // MARK: - Initialization

  /// RemoteImage를 생성합니다. (이미지 다운로드, 캐싱 구현)
  /// - Parameters:
  ///   - url: 다운로드 할 이미지의 url
  ///   - imageView: 다운로드 한 이미지를 생성하는 뷰
  ///   - placeHolderView: 로딩 중을 나타내는 뷰 - 기본값은 circular ProgressView입니다.
  ///   - errorView: 에러를 나타내는 뷰 - 기본값은 Text 입니다.
  init(
    url: URL?,
    @ViewBuilder imageView: @escaping (Image) -> ImageView,
    @ViewBuilder placeHolderView: @escaping () -> PlaceHolderView? = {
      ProgressView()
        .progressViewStyle(.circular)
    },
    @ViewBuilder errorView: @escaping (Error) -> ErrorView? = { _ in
      Text("이미지 로딩 실패")
    }
  ) {
    self.url = url
    self.errorView = errorView
    self.imageView = imageView
    self.placeHolderView = placeHolderView
  }

  // MARK: - Body

  var body: some View {
    Group {
      switch service.state {
      case .error(let error):
        errorView(error)

      case .image(let image):
        imageView(Image(uiImage: image))

      case .loading:
        placeHolderView()
          .onAppear {
            // 이미지 다운로드/캐시
            service.fetchImage(with: url)
          }
      }
    }
  }
}
