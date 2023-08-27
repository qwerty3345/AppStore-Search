//
//  ExpandableTextView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI


struct ExpandableTextView: View {
  let text: String
  let lineLimit = 3
  @State private var isExpanded = false
  @State private var isTruncated = false

  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      Text(text)
        .frame(maxWidth: .infinity, alignment: .leading)
        .lineLimit(isExpanded ? nil : lineLimit)
        .checkIsTruncated(
          text: text,
          withLineLimit: lineLimit,
          isTruncated: $isTruncated
        )

      if !isExpanded && isTruncated {
        Text(isTruncated ? " 더 보기" : "")
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

struct TextTruncatedCheckModifier: ViewModifier {
  let text: String
  let lineLimit: Int
  @Binding var isTruncated: Bool

  func body(content: Content) -> some View {
    content
      .background(
        Text(text)
          .lineLimit(lineLimit)
          .background(
            GeometryReader { visibleTextGeometry in
              ZStack {
                Text(text)
                  .background(
                    GeometryReader { fullTextGeometry in
                      Color.clear.onAppear {
                        // isTruncated 업데이트
                        isTruncated = fullTextGeometry.size.height > visibleTextGeometry.size.height
                      }
                    }
                  )
              }
              .frame(height: .greatestFiniteMagnitude)
            }
          )
          .hidden()
      )
  }
}

private extension View {
  /// 해당 텍스트가 lineLimit를 기준으로 잘리는지 아닌지를 확인하고 업데이트
  func checkIsTruncated(
    text: String,
    withLineLimit lineLimit: Int,
    isTruncated: Binding<Bool>
  ) -> some View {
    self.modifier(
      TextTruncatedCheckModifier(
        text: text,
        lineLimit: lineLimit,
        isTruncated: isTruncated
      )
    )
  }
}

struct ExpandableTextView_Previews: PreviewProvider {
  static var previews: some View {
    ExpandableTextView(text: String(repeating: "asdkajf kjsadfla sdk", count: 144))
  }
}
