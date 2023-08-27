//
//  StarRatingView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

/// 별점을 나타내는 View (0.0 ~ 5.0)
struct StarRatingView: View {
  let rating: Double
  let filledStarColor: Color
  let emptyStarColor: Color
  let width: CGFloat
  let height: CGFloat

  init(
    rating: Double,
    filledStarColor: Color = .gray,
    emptyStarColor: Color = .gray,
    width: CGFloat = 16,
    height: CGFloat = 16
  ) {
    self.rating = rating
    self.filledStarColor = filledStarColor
    self.emptyStarColor = emptyStarColor
    self.width = width
    self.height = height
  }

  var body: some View {
    HStack(spacing: 2) {
      ForEach(0..<5) { index in
        Image(systemName: starType(for: index))
          .resizable()
          .foregroundColor(starColor(for: index))
          .frame(width: width, height: height)
      }
    }
  }

  func starType(for index: Int) -> String {
    guard rating > Double(index) else { return "star" }

    if rating - Double(index) >= 1 {
      return "star.fill"
    } else {
      return "star.leadinghalf.fill"
    }
  }

  func starColor(for index: Int) -> Color {
    return rating > Double(index) ? filledStarColor : emptyStarColor
  }
}

struct StarRatingView_Previews: PreviewProvider {
  static var previews: some View {
    StarRatingView(rating: 2.0)
      .previewLayout(.fixed(width: 200, height: 100))
  }
}
