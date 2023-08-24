//
//  ExpandableTextView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI


struct ExpandableTextView: View {
  let text: String
  @State private var isExpanded = false

  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      Text(text)
        .lineLimit(isExpanded ? nil : 3)
        .frame(maxWidth: .infinity, alignment: .leading)

      if !isExpanded {
        Text(" 더 보기")
          .foregroundColor(.accentColor)
          .background(.white)
      }
    }
    .onTapGesture {
      withAnimation {
        isExpanded = true
      }
    }
  }
}


struct ExpandableTextView_Previews: PreviewProvider {
  static var previews: some View {
    ExpandableTextView(text: String(repeating: "asdkajf kjsadfla sdk", count: 100))
  }
}
