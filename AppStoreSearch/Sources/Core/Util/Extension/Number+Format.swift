//
//  Number+Format.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import Foundation

extension Double {
  func rounded(to places: Int) -> String {
    let divisor = pow(10.0, Double(places))
    let roundedValue = (self * divisor).rounded() / divisor
    return String(format: "%.1f", roundedValue)
  }
}
