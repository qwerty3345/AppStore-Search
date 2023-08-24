//
//  StarRatingView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct StarRatingView: View {
  let rating: Double
  let filledStarColor: Color
  let emptyStarColor: Color

  init(
    rating: Double,
    filledStarColor: Color = .gray,
    emptyStarColor: Color = .gray
  ) {
    self.rating = rating
    self.filledStarColor = filledStarColor
    self.emptyStarColor = emptyStarColor
  }

  var body: some View {
    HStack(spacing: 2) {
      ForEach(0..<5) { index in
        Image(systemName: starType(for: index))
          .foregroundColor(starColor(for: index))
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
  }
}
