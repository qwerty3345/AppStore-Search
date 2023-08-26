//
//  Store.swift
//  
//
//  Created by Mason Kim on 2023/08/26.
//

import Foundation
import Combine

/// Reducer 타입을 통해 Store 를 쉽게 타입추론 / 생성 하기 위한 typealias
public typealias StoreOf<R: ReducerProtocol> = Store<R.State, R.Action>

public final class Store<State, Action>: ObservableObject {

  // MARK: - Properties

  /// 관찰 가능한 Store의 상태값
  @Published public private(set) var state: State

  private let reducer: AnyReducer<State, Action>

  private let queue = DispatchQueue(label: "serial_queue", qos: .userInitiated)
  private var cancellables: Set<AnyCancellable> = []
  private var tasks: Set<Task<(), Never>> = []

  // MARK: - Initialization

  public init<R: ReducerProtocol>(
    reducer: R
  ) where R.State == State, R.Action == Action {
    self.reducer = AnyReducer(reducer)
    self.state = reducer.initialState
  }

  deinit {
    tasks.forEach {
      $0.cancel()
    }
  }

  // MARK: - Public Methods

  public func dispatch(_ action: Action) {
    queue.sync {
      dispatch(&state, action)
    }
  }

  // MARK: - Private Methods

  private func dispatch(_ state: inout State, _ action: Action) {
    let effect = reducer.reduce(state: &state, action: action)

    switch effect {
    case let .publisher(publisher):
      publisher
        .receive(on: DispatchQueue.main)
      // effect에 의해 트리거 된 새로운 액션을 실행함 (dispatch)
        .sink(receiveValue: dispatch)
        .store(in: &cancellables)

    case let .task(task):
      let newTask = Task {
        let action = await task.value
        await MainActor.run {
          dispatch(action)
        }
      }
      tasks.insert(newTask)

    case .none:
      break
    }
  }
}
