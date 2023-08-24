//
//  AppDetailView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct AppDetailView: View {
  let result: SearchResult

  var body: some View {
    VStack {
      headerSection

      Divider()

      infoSection

      Divider()
    }
  }

  private var headerSection: some View {
    HStack {
      RoundedRectangle(cornerRadius: 16)
        .foregroundColor(.gray)
        .frame(width: 126, height: 126)
        .padding(.trailing)
      //        AsyncImage(url: result.artworkUrl100)
      //          .cornerRadius(16)

      VStack {
        VStack(alignment: .leading) {
          Text(result.trackName)
            .font(.title)
            .fontWeight(.bold)
          Text(result.artistName)
            .foregroundColor(.gray)
            .font(.body)
            .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

        //          Spacer()

        HStack {
          Button {

          } label: {
            Text("받기")
              .foregroundColor(.blue)
              .fontWeight(.bold)
              .frame(width: 80, height: 32)
              .background(.gray.opacity(0.2))
              .cornerRadius(16)
          }

          Spacer()

          Button {
            // 공유 액션
          } label: {
            Image(systemName: "square.and.arrow.up")
              .resizable()
              .scaledToFit()
              .frame(width: 32, height: 32)
              .fontWeight(.medium)
          }
        }
      }
    }
    .padding(.horizontal)
  }

  private var infoSection: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ratingInfoView
      }
    }
  }

  private var ratingInfoView: some View {
    VStack {
      Text("\(result.userRatingCountText)개의 평가")
      Text("\(result.averageUserRating)")
    }
  }
}

struct AppDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AppDetailView(result: .mock)
  }
}
