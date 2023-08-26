//
//  AppDetailReleaseNoteSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailReleaseNoteSection: View {
  let model: DetailReleaseNoteSectionModel

  var body: some View {
    VStack(spacing: 12) {
      HStack {
        Text("새로운 기능")
          .font(.title2)
          .fontWeight(.bold)
        Spacer()
        Button("버전 기록") {}
      }

      HStack {
        Text("버전 \(model.version)")
        Spacer()
        Text("\(model.updateDatePassedDayText) 전")
      }
      .foregroundColor(.gray)

      if let releaseNotes = model.releaseNotes {
        ExpandableTextView(text: releaseNotes)
      }
    }
    .padding(.horizontal)
  }
}

struct DetailReleaseNoteSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailReleaseNoteSection(
      model: .init(from: .mock)
    )
  }
}
