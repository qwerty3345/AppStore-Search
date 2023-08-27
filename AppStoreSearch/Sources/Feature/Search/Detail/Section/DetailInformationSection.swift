//
//  DetailInformationSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailInformationSection: View {
  let model: DetailInformationSectionModel

  var body: some View {
    VStack {
      Text("정보")
        .font(.title2)
        .fontWeight(.bold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom)

      ForEach(DetailInformation.allCases, id: \.self) { information in
        DetailInformationRow(information: information, model: model)

        if information != DetailInformation.allCases.last {
          Divider()
        }
      }
    }
    .padding(.horizontal)
  }
}

// MARK: - InformationRow

struct DetailInformationRow: View {
  let information: DetailInformation
  let model: DetailInformationSectionModel

  var body: some View {
    HStack(alignment: .bottom) {
      Text(information.title)
        .font(.callout)
        .foregroundColor(.gray)
      Spacer()
      Text(information.value(from: model))
        .font(.body)
    }
  }
}

// MARK: - DetailInformation

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

  func value(
    from model: DetailInformationSectionModel
  ) -> String {
    switch self {
    case .developer: return model.artistName
    case .size: return model.fileSizeByteText
    case .category: return model.firstGenre
    case .regulation: return model.contentAdvisoryRating
    }
  }
}

// MARK: - Preview

struct DetailInformationSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailInformationSection(model: .init(from: .mock))
  }
}
