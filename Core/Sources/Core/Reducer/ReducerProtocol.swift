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

  typealias Effect = EffectType<Action>

  var initialState: State { get }

  func reduce(state: inout State, action: Action) -> Effect
}

/// 다른 액션을 트리거하는 Side-effect
///
/// 비동기 로직은 해당 Effect로 처리
public enum EffectType<Action> {
  case publisher(AnyPublisher<Action, Never>)
  case task(Task<Action, Never>)
  case none
}
