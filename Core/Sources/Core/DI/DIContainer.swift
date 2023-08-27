//
//  File.swift
//  
//
//  Created by Mason Kim on 2023/08/27.
//

import Foundation

public final class DIContainer {

  // MARK: - Storage

  private var storage: [String: Any] = [:]

  // MARK: - Singleton

  public static let shared = DIContainer()
  private init() {}

  // MARK: - Public Methods

  public func register<T>(type: T.Type, _ object: T) {
    storage["\(type)"] = object
  }

  public func resolve<T>(type: T.Type) -> T {
    guard let object = storage["\(type)"] as? T else {
      fatalError("\(type)에 해당하는 객체가 등록되지 않았습니다.")
    }
    return object
  }
}
