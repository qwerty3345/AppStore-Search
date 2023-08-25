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
