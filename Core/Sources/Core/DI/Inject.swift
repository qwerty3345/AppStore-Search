//
//  Inject.swift
//  
//
//  Created by Mason Kim on 2023/08/27.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
  public let wrappedValue: T

  public init() {
    self.wrappedValue = DIContainer.shared.resolve(type: T.self)
  }
}
