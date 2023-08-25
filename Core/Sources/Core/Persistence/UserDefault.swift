//
//  UserDefault.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
  private let key: String
  private let defaultValue: T

  public init(key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }

  public var wrappedValue: T {
    get { return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
    set { UserDefaults.standard.set(newValue, forKey: key) }
  }
}
