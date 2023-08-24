//
//  AppDetailInfoSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailHorizontalInfoSection: View {
  let result: SearchResult

  var divider: some View {
    Divider().padding(.vertical)
  }

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ratingInfoView
        divider

        ageInfoView
        divider

        categoryInfoView
        divider

        developerInfoView
      }
      .frame(height: 100, alignment: .center)
    }
  }

  private var ratingInfoView: some View {
    InfoView(
      headerText: "\(result.userRatingCountText)개의 평가",
      footerText: "\(result.averageUserRatingText)"
    ) {
      StarRatingView(rating: result.averageUserRating)
    }
  }

  private var ageInfoView: some View {
    InfoView(
      headerText: "연령",
      footerText: "세"
    ) {
      Text("\(result.contentAdvisoryRating)")
        .font(.title2)
        .fontWeight(.bold)
    }
  }

  private var categoryInfoView: some View {
    InfoView(
      headerText: "카테고리",
      footerText: "\(result.genres.first ?? "")"
    ) {
      Image(systemName: "tray")
        .font(.title2)
        .fontWeight(.bold)
    }
  }

  private var developerInfoView: some View {
    InfoView(
      headerText: "개발자",
      footerText: "\(result.artistName)"
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
    DetailHorizontalInfoSection(result: .mock)
  }
}
