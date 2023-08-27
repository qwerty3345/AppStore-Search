//
//  DetailDescriptionSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailDescriptionSection: View {
  let model: DetailDescriptionSectionModel

  var body: some View {
    VStack {
      ExpandableTextView(text: model.description)
        .padding(.bottom)

      Button(action: {}) {
        developerInfoView
      }
    }
    .padding(.horizontal)
  }

  private var developerInfoView: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(model.artistName)
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

struct DetailDescriptionSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailDescriptionSection(
      model: .init(from: .mock)
    )
  }
}
