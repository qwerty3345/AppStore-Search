//
//  AppDetailHeaderSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct AppDetailHeaderSection: View {
  let result: SearchResult

  var body: some View {
    HStack {
      RoundedRectangle(cornerRadius: 16)
        .foregroundColor(.gray)
        .frame(width: 120, height: 120)
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
              .frame(width: 24, height: 24)
              .fontWeight(.medium)
          }
        }
      }
    }
    .padding(.horizontal)
  }
}

struct AppDetailHeaderSection_Previews: PreviewProvider {
  static var previews: some View {
    AppDetailHeaderSection(result: .mock)
  }
}
