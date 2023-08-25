//
//  HTTPTask.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

public enum HTTPTask {
  case requestPlain
  case requestParameters(_ queryParameters: Parameters)
  /// header, body 활용 로직이 필요하다면 차후 구현
}
