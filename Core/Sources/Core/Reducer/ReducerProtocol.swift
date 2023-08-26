//
//  Reducer.swift
//  
//
//  Created by Mason Kim on 2023/08/26.
//

import Foundation
import Combine

public protocol ReducerProtocol {
  associatedtype State
  associatedtype Action

  /// 다른 액션을 트리거하는 Side-effect
  ///
  /// 비동기 로직은 해당 Effect로 처리
  typealias Effect = AnyPublisher<Action, Never>

  var initialState: State { get }

  func reduce(state: inout State, action: Action) -> Effect
}
