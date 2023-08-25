//
//  ImageCacheManager.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import UIKit

final class ImageCacheManager {

  // MARK: - Constants

  private enum Constants {
    /// 초기 제약: 500메가바이트
    static let initialByteLimit = 500 * megaByteUnit
    static let kiloByteUnit = 1024
    static let megaByteUnit = 1024 * 1024
  }

  // MARK: - Singleton

  static let shared = ImageCacheManager()

  private init() {
    cache.countLimit = countLimit
    cache.totalCostLimit = byteLimit
  }

  // MARK: - Properties

  private let cache = NSCache<NSURL, UIImage>()

  /// 총 500개 까지만 캐싱
  var countLimit = 500 {
    didSet { cache.countLimit = countLimit }
  }
  /// 메모리 캐싱 시의 용량 제약
  var byteLimit: Int = Constants.initialByteLimit {
    didSet { cache.totalCostLimit = byteLimit }
  }
  var megaByteLimit: Int {
    get { byteLimit / Constants.megaByteUnit }
    set { byteLimit = newValue * Constants.megaByteUnit }
  }
  var kiloByteLimit: Int {
    get { byteLimit / Constants.kiloByteUnit }
    set { byteLimit = newValue * Constants.kiloByteUnit }
  }

  // MARK: - Public Methods

  func get(for url: URL) -> UIImage? {
    cache.object(forKey: url as NSURL)
  }

  func store(_ value: UIImage, for url: URL) {
    let bytesOfImage = value.pngData()?.count ?? 0
    cache.setObject(value, forKey: url as NSURL, cost: bytesOfImage)
  }

  func removeAll() {
    cache.removeAllObjects()
  }

}
