//
//  AppDetailView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct AppDetailView: View {
  
  // MARK: - Properties
  
  let result: SearchResult
  @State private var shareItem: ShareItem?
  
  // MARK: - Body
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        DetailHeaderSection(
          model: .init(from: result),
          shareItem: $shareItem
        )
        .padding(.bottom)
        horizontalDivider
        
        DetailHorizontalInfoSection(
          model: .init(from: result)
        )
        horizontalDivider
        
        DetailReleaseNoteSection(
          model: .init(from: result)
        )
        horizontalDivider
        
        DetailScreenShotSection(
          screenshots: .init(from: result)
        )
        
        DetailDescriptionSection(
          model: .init(from: result)
        )
        .padding(.bottom)
        horizontalDivider
        
        DetailInformationSection(
          model: .init(from: result)
        )
      }
    }
    .navigationBarTitle("", displayMode: .inline)
    .sheet(item: $shareItem) { shareItem in
      ActivityView(
        text: shareItem.shareText
      )
    }
  }
  
  // MARK: - Private Methods
  
  private var horizontalDivider: some View {
    Divider().padding(.horizontal)
  }
}

// MARK: - Preview

struct AppDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      AppDetailView(result: .mock)
    }
  }
}
