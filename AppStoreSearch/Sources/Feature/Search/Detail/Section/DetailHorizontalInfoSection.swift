//
//  AppDetailInfoSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailHorizontalInfoSection: View {

  // MARK: - Properties

  let model: DetailHorizontalInfoSectionModel

  // MARK: - Body

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ratingInfoView
        infoDivider

        ageInfoView
        infoDivider

        categoryInfoView
        infoDivider

        developerInfoView
      }
      .frame(height: 100, alignment: .center)
    }
  }

  // MARK: - Private

  private var infoDivider: some View {
    Divider().padding(.vertical)
  }

  private var ratingInfoView: some View {
    InfoView(
      headerText: "\(model.userRatingCountText)개의 평가",
      footerText: "\(model.averageUserRatingText)"
    ) {
      StarRatingView(rating: model.averageUserRating)
    }
  }

  private var ageInfoView: some View {
    InfoView(
      headerText: "연령",
      footerText: "세"
    ) {
      Text("\(model.contentAdvisoryRating)")
        .font(.title2)
        .fontWeight(.bold)
    }
  }

  private var categoryInfoView: some View {
    InfoView(
      headerText: "카테고리",
      footerText: "\(model.firstGenre)"
    ) {
      Image(systemName: "tray")
        .font(.title2)
        .fontWeight(.bold)
    }
  }

  private var developerInfoView: some View {
    InfoView(
      headerText: "개발자",
      footerText: "\(model.artistName)"
    ) {
      Image(systemName: "person.crop.square")
        .font(.title2)
        .fontWeight(.bold)
    }
  }
}

struct InfoView<Content: View>: View {

  let headerText: String
  let footerText: String
  let content: () -> Content

  init(
    headerText: String,
    footerText: String,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.headerText = headerText
    self.footerText = footerText
    self.content = content
  }

  var body: some View {
    VStack(spacing: 8) {
      Text(headerText)
        .font(.caption)

      content()

      Text(footerText)
        .font(.footnote)
    }
    .frame(minWidth: 60)
    .padding(.horizontal)
    .foregroundColor(.gray)
  }
}


struct DetailInfoSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailHorizontalInfoSection(model: .init(from: .mock))
  }
}
