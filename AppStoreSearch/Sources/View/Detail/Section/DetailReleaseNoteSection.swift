//
//  AppDetailReleaseNoteSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailReleaseNoteSection: View {
  let result: SearchResult

  var body: some View {
    VStack(spacing: 12) {
      HStack {
        Text("새로운 기능")
          .font(.title2)
          .fontWeight(.bold)
        Spacer()
        Button("버전 기록") {
          // 버전 기록 화면으로 이동
        }
      }

      HStack {
        Text("버전 \(result.version)")
        Spacer()
        Text("\(result.updateDatePassedDayText) 전")
      }
      .foregroundColor(.gray)

      ExpandableTextView(text: result.releaseNotes)
    }
    .padding(.horizontal)
  }
}

struct DetailReleaseNoteSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailReleaseNoteSection(result: SearchResponse.mock.results[6])
  }
}
