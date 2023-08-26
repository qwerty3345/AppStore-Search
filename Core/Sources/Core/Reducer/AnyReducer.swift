//
//  AnyReducer.swift
//  
//
//  Created by Mason Kim on 2023/08/26.
//

import Foundation
import Combine

/// Store를 생성할 때, `ReducerProtocol`을 제네릭 타입추론이 가능하게 하기 위한 `AnyReducer`타입
struct AnyReducer<State, Action>: ReducerProtocol {
  let initialState: State
  private let _reduce: (inout State, Action) -> AnyPublisher<Action, Never>

  init<R: ReducerProtocol>(_ reducer: R) where R.State == State, R.Action == Action {
    self.initialState = reducer.initialState
    self._reduce = reducer.reduce
  }

   func reduce(state: inout State, action: Action) -> AnyPublisher<Action, Never> {
     return _reduce(&state, action)
   }
}
