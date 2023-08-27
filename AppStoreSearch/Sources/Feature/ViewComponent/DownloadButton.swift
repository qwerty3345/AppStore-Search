//
//  DownloadButton.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/27.
//

import SwiftUI

struct DownloadButton: View {
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text("받기")
        .foregroundColor(.blue)
        .fontWeight(.bold)
        .frame(width: 80, height: 32)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
    }
  }
}
