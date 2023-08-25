//
//  Double+ByteUnitFormat.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import Foundation

extension Double {
  /// 1028.0 바이트를 표시하는 Double을 "1.1MB" 형태로 변환
  public var byteUnitText: String {
    for unit in ByteUnit.allCases {
      if self > unit.unitByte {
        let unitByte = Double(self) / unit.unitByte
        let unitByteText = String(format: "%.1f", unitByte)
        return "\(unitByteText)\(unit.suffix)"
      }
    }
    return ""
  }
}

private enum ByteUnit: CaseIterable {
  case giga
  case mega
  case kilo

  var suffix: String {
    switch self {
    case .giga: return "GB"
    case .mega: return "MB"
    case .kilo: return "KB"
    }
  }

  var unitByte: Double {
    let unit = 1024.0
    switch self {
    case .giga: return pow(unit, 3)
    case .mega: return pow(unit, 2)
    case .kilo: return pow(unit, 1)
    }
  }
}
