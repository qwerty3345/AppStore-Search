//
//  AppDetailView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct AppDetailView: View {
  let result: SearchResult
  @State private var shareItem: ShareItem?

  var body: some View {
    ScrollView {
      VStack {
        Group {
          DetailHeaderSection(
            result: result,
            shareItem: $shareItem
          )
          .padding(.bottom)

          Divider().padding(.horizontal)

          DetailHorizontalInfoSection(result: result)
          
          Divider().padding(.horizontal)

          DetailReleaseNoteSection(result: result)

          Divider().padding(.horizontal)
        }

        Group {
          DetailScreenShotSection(result: result)

          DetailDescriptionSection(result: result)
            .padding(.bottom)

          Divider().padding(.horizontal)

          DetailInformationSection(result: result)
        }
      }
    }
    .navigationBarTitle("", displayMode: .inline)
    .sheet(item: $shareItem) { shareItem in
      ActivityView(
        text: shareItem.shareText
      )
    }
  }
}

struct AppDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      AppDetailView(result: .mock)
    }
  }
}
