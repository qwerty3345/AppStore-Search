//
//  RemoteImageState.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import UIKit

enum RemoteImageState {
  case error(_ error: Error)
  case image(_ image: UIImage)
  case loading
}

extension RemoteImageState: Equatable {
  static func == (lhs: RemoteImageState, rhs: RemoteImageState) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading): return true
    case (.image(let lhsImage), .image(let rhsImage)):
      return lhsImage == rhsImage
    case (.error(let lhsError), .error(let rhsError)):
      return lhsError.localizedDescription == rhsError.localizedDescription
    default:
      return false
    }
  }
}
