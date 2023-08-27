//
//  ShareButton.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/27.
//

import SwiftUI

struct ShareButton: View {
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Image(systemName: "square.and.arrow.up")
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .fontWeight(.medium)
    }
  }
}
