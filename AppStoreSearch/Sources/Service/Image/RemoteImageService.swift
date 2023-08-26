//
//  RemoteImageService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import UIKit
import Core
import Combine

enum RemoteImageServiceError: Error {
  case failToFetchImage
  case failToCreateImage
}

/// `RemoteImage` 를 위한 이미지 다운로드, 캐싱 Service
final class RemoteImageService: ObservableObject {
  private var cancellable: AnyCancellable?

  private let cacheManager = ImageCacheManager.shared
  private let router = NetworkRouter()

  var state: RemoteImageState = .loading {
    didSet {
      guard state != oldValue else { return }
      objectWillChange.send()
    }
  }

  func fetchImage(with url: URL?) {
    cancellable?.cancel()

    guard let url else {
      state = .error(NetworkError.invalidURL)
      return
    }

    if let cachedImage = cacheManager.get(for: url) {
      state = .image(cachedImage)
      return
    }

    cancellable = router.requestData(with: url)
      .receive(on: DispatchQueue.main)
      .map { UIImage(data: $0) }
      .map { image -> RemoteImageState in
        if let image {
          return .image(image)
        } else {
          return .error(RemoteImageServiceError.failToCreateImage)
        }
      }
      .replaceError(with: RemoteImageState.error(RemoteImageServiceError.failToFetchImage))
      .sink { [weak self] state in
        self?.state = state
      }
  }
}

