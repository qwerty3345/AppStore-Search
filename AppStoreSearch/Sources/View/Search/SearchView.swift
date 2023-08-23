//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

struct SearchView: View {
  @State private var searchText = ""
  let mock = ["녹음기", "엠넷", "1234", "63146", "234", "234", "23467", "2354", "134", "6345", "엠넷", "진에어", "녹음기", "엠넷", "진에어", "녹음기", "엠넷", "진에어", "녹음기", "엠넷", "진에어", "녹음기", "엠넷", "진에어"]

  var body: some View {
    NavigationStack {
      Section {
        List(mock, id: \.self) { data in
          Button {
            // TODO: 여기서 특정 아이템이 눌렸을 때, searchable이 trigger되게...
            searchText = data
          } label: {
            Text(data)
              .foregroundColor(.blue)
              .font(.title3)
          }
        }
        .listStyle(.plain)
      } header: {
        recentSearchTitle
      }
      .navigationTitle("검색")
    }
    .searchable(
      text: $searchText,
      placement: .navigationBarDrawer(displayMode: .always),
      prompt: "App Store"
    )
    .onSubmit(of: .search) {
      // TODO: 검색 시,
    }
  }

  var recentSearchTitle: some View {
    Text("최근 검색어")
      .font(.title2)
      .fontWeight(.bold)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)
      .padding(.top)
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}

