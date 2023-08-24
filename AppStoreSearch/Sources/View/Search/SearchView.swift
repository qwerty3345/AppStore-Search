//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

enum SearchState {
  case recent
  case result
}

struct SearchView: View {
  @State private var searchText = ""
  @State private var searchState: SearchState = .recent

  @State private var suggestions: [String] = []
  @State private var currentSuggestionTask: Task<Void, Error>? = nil

  let searchService = SearchService(router: NetworkRouter())

  let mockRecentSearch = ["최근검색1", "최근검색2"]
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
    .searchSuggestions {
      suggestionView
    }
    .onSubmit(of: .search) {
      // TODO: 검색 시, Service에서 호출해서 받아오게 구현
      searchState = .result
    }
    .onChange(of: searchText) { searchText in
      currentSuggestionTask?.cancel()

      currentSuggestionTask = Task {
        suggestions = try await searchService.suggestion(of: searchText)
      }

      searchState = .recent
    }
  }

  @ViewBuilder
  private var showingList: some View {
    switch searchState {
    case .recent:
      recentSearchList
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

  private var suggestionView: some View {
    ForEach(suggestions, id: \.self) { suggestion in
      HStack(spacing: 0) {
        Text("")  // Image가 가장 앞에 있으면 Divider가 살짝 잘리는 이슈 때문에 추가함.

        Image(systemName: "magnifyingglass")
          .padding(.trailing, 8)
        Text(suggestion)
      }
      .searchCompletion(suggestion)
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

