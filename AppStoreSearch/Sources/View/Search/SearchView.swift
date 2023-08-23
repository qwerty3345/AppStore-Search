//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

enum SearchState {
  case recent
  case suggestion
  case result
}

struct SearchView: View {
  @State private var searchText = ""
  @State private var searchState: SearchState = .recent

  let mockRecentSearch = ["최근검색1", "최근검색2"]
  let mockSuggestion = ["제안1", "제안2", "제안3", "제안4"]
  let mockSearchResult = ["검색결과1", "검색결과2"]

  var body: some View {
    NavigationStack {
      showingList
        .navigationTitle("검색")
    }
    .searchable(
      text: $searchText,
      placement: .navigationBarDrawer(displayMode: .always),
      prompt: "App Store"
    )
    .onSubmit(of: .search) {
      // TODO: 검색 시, Service에서 호출해서 받아오게 구현
      searchState = .result
    }
    .onChange(of: searchText) { newValue in
      searchState = searchText.isEmpty ? .recent : .suggestion
    }
  }

  @ViewBuilder
  private var showingList: some View {
    switch searchState {
    case .recent:
      recentSearchList
    case .suggestion:
      suggestionList
    case .result:
      searchResultList
    }
  }

  private var recentSearchList: some View {
    Section {
      List(mockRecentSearch, id: \.self) { data in
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
  }

  private var recentSearchTitle: some View {
    Text("최근 검색어")
      .font(.title2)
      .fontWeight(.bold)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)
      .padding(.top)
  }

  private var suggestionList: some View {
    List(mockSuggestion, id: \.self) { data in
      Button {
        // TODO: 여기서 특정 아이템이 눌렸을 때, 실제 검색을 trigger
        searchText = data
      } label: {
        HStack(spacing: 0) {
          Text("")  // Image가 가장 앞에 있으면 Divider가 살짝 잘리는 이슈 때문에 추가함.

          Image(systemName: "magnifyingglass")
            .padding(.trailing, 8)
          Text(data)
        }
      }
    }
    .listStyle(.plain)
  }

  private var searchResultList: some View {
    Text("검색 결과 표출")
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}

