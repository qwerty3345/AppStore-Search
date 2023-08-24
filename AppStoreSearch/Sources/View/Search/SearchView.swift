//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI

enum SearchState {
  case searching
  case showingResult
}

struct SearchView: View {
  @State private var searchText = ""
  @State private var searchState: SearchState = .searching

  @State private var suggestions: [String] = []
  @State private var searchResults: [SearchResult] = []

  let mockRecentSearch = ["최근검색1", "최근검색2"]

  let searchService = SearchService(router: NetworkRouter())


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
      if searchState == .searching {
        suggestionView
      }
    }
    .onSubmit(of: .search) {
      search()
    }
    .task(id: searchText) {
      suggestions = (try? await searchService.suggestion(of: searchText)) ?? []
    }
    .onChange(of: searchText) { searchText in
      searchState = .searching
    }
  }

  @ViewBuilder
  private var showingList: some View {
    switch searchState {
    case .searching:
      recentSearchList
    case .showingResult:
      searchResultList
    }
  }

  private var recentSearchList: some View {
    Section {
      List(mockRecentSearch, id: \.self) { data in
        Button {
          searchText = data
          search()
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
    List(searchResults) { result in
      Text(result.trackName)
    }
  }

  // MARK: - Private Methods

  private func search() {
    Task {
      searchResults = try await searchService.search(of: searchText)
      searchState = .showingResult
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}

