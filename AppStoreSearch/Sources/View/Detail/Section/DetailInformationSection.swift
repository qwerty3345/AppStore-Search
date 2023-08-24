//
//  DetailInformationSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailInformationSection: View {
  let result: SearchResult

  var body: some View {
    VStack {
      Text("정보")
        .font(.title2)
        .fontWeight(.bold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom)

      ForEach(DetailInformation.allCases.indices, id: \.self) { index in
        let information = DetailInformation.allCases[index]

        HStack(alignment: .bottom) {
          Text(information.title)
            .font(.callout)
            .foregroundColor(.gray)
          Spacer()
          Text(information.value(from: result))
            .font(.body)
        }

        if index != DetailInformation.allCases.count - 1 {
          Divider()
        }
      }
    }
    .padding(.horizontal)
  }
}

enum DetailInformation: CaseIterable {
  case developer
  case size
  case category
  case regulation

  var title: String {
    switch self {
    case .developer: return "제공자"
    case .size: return "크기"
    case .category: return "카테고리"
    case .regulation: return "연령 등급"
    }
  }

  func value(from result: SearchResult) -> String {
    switch self {
    case .developer: return result.artistName
    case .size: return result.fileSizeByteText
    case .category: return result.genres.first ?? ""
    case .regulation: return result.contentAdvisoryRating
    }
  }
}

struct DetailInformationSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailInformationSection(result: .mock)
  }
}
