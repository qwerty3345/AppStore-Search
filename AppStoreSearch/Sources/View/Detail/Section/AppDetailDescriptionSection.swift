//
//  AppDetailDescriptionSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct AppDetailDescriptionSection: View {
  let result: SearchResult

  var body: some View {
    VStack {
      ExpandableTextView(text: result.description)
        .padding(.bottom)

      Button {
        // 개발자 정보로 이동
      } label: {
        HStack {
          VStack(alignment: .leading) {
            Text(result.artistName)
              .foregroundColor(.accentColor)
              .font(.callout)

            Text("개발자")
              .font(.footnote)
              .foregroundColor(.gray)
          }

          Spacer()

          Image(systemName: "chevron.forward")
            .foregroundColor(.gray)
            .font(.title3)
        }
      }
    }
    .padding(.horizontal)
  }
}

struct AppDetailDescriptionSection_Previews: PreviewProvider {
  static var previews: some View {
    AppDetailDescriptionSection(result: .mock)
  }
}
