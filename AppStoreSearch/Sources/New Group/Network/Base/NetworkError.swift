//
//  NetworkError.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

enum NetworkError: LocalizedError {
  case transportError(Error)
  case invalidStatusCode
  case invalidData
  case invalidURL
  case parseError

  var errorDescription: String? {
    switch self {
    case .transportError(let error):
      return "에러: \(error.localizedDescription)"
    case .invalidStatusCode:
      return "서버 응답 코드 에러"
    case .invalidData:
      return "유효하지 않은 데이터입니다."
    case .invalidURL:
      return "유효하지 않은 URL입니다."
    case .parseError:
      return "파싱에 실패하였습니다."
    }
  }
}
