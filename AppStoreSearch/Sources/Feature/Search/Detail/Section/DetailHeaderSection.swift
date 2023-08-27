//
//  AppDetailHeaderSection.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct DetailHeaderSection: View {
  let model: DetailHeaderSectionModel
  @Binding var shareItem: ShareItem?

  var body: some View {
    HStack {
      RemoteImage(url: model.artworkUrl100) { image in
        image
          .resizable()
          .cornerRadius(16)
      }
      .frame(width: 110, height: 110)

      VStack {
        VStack(alignment: .leading) {
          Text(model.trackName)
            .font(.title3)
            .fontWeight(.bold)
          Text(model.artistName)
            .foregroundColor(.gray)
            .font(.callout)
            .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

        HStack {
          DownloadButton(action: {})
          Spacer()
          ShareButton {
            shareItem = model.toShareItem()
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
      model: .init(from: .mock),
      shareItem: .constant(nil)
    )
  }
}
