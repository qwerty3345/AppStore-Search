//
//  RemoteImageService.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation
import UIKit

enum RemoteImageServiceError: Error {
  case failToCreateImage
}

/// `RemoteImage` 를 위한 이미지 다운로드, 캐싱 Service
final class RemoteImageService: ObservableObject {
  private var downloadTask: Task<Void, Error>?

  private let cacheManager = ImageCacheManager.shared
  private let router = NetworkRouter()

  var state: RemoteImageState = .loading {
    didSet {
      objectWillChange.send()
    }
  }

  @MainActor
  func fetchImage(with url: URL?) {
    downloadTask?.cancel()

    guard let url else {
      state = .error(NetworkError.invalidURL)
      return
    }

    if let cachedImage = cacheManager.get(for: url) {
      state = .image(cachedImage)
      return
    }

    downloadTask = Task {
      do {
        let data = try await router.requestData(with: url)
        guard let image = UIImage(data: data) else {
          throw RemoteImageServiceError.failToCreateImage
        }

        cacheManager.store(image, for: url)

        state = .image(image)
      } catch {
        state = .error(error)
      }
    }
  }
}

