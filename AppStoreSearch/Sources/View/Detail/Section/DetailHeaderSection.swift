//
//  AppDetailHeaderSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailHeaderSection: View {
  let result: SearchResult
  @Binding var shareItem: ShareItem?

  var body: some View {
    HStack {
      RemoteImage(url: result.artworkUrl100) { image in
        image
          .resizable()
          .cornerRadius(16)
      }
      .frame(width: 110, height: 110)

      VStack {
        VStack(alignment: .leading) {
          Text(result.trackName)
            .font(.title3)
            .fontWeight(.bold)
          Text(result.artistName)
            .foregroundColor(.gray)
            .font(.callout)
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
            shareItem = ShareItem(
              id: result.id,
              trackName: result.trackName
            )
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

struct DetailHeaderSection_Previews: PreviewProvider {
  static var previews: some View {
    DetailHeaderSection(
      result: .mock,
      shareItem: .constant(nil)
    )
  }
}
