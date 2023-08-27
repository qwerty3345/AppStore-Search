//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/24.
//

import SwiftUI
import Core

struct SearchView: View {
  @EnvironmentObject var store: StoreOf<SearchReducer>

  var body: some View {
    NavigationStack {
      showingList
        .navigationTitle("검색")
        .navigationDestination(for: SearchResult.self) { result in
          AppDetailView(result: result)
        }
    }
    .searchable(
      text:
        Binding(
          get: { store.state.searchText },
          set: { store.dispatch(.change(searchText: $0)) }
        ),
      placement: .navigationBarDrawer(displayMode: .always),
      prompt: "App Store"
    )
    .searchSuggestions {
      if store.state.showingState == .searching {
        suggestionView
      }
    }
    .onSubmit(of: .search) {
      store.dispatch(.search)
    }
    .onAppear {
      store.dispatch(.onAppear)
    }
    .animation(.easeInOut, value: store.state.showingState)
    .animation(.easeInOut, value: store.state.searchResults)
  }

  @ViewBuilder
  private var showingList: some View {
    switch store.state.showingState {
    case .searching:
      recentSearchList
    case .showingResult:
      SearchResultView(
        results: store.state.searchResults
      )
    case .loading:
      ProgressView()
        .progressViewStyle(.circular)
    case .showingError:
      errorStateView
    case .showingEmpty:
      emptyStateView
    }
  }

  private var recentSearchList: some View {
    Section {
      List(store.state.histories, id: \.self) { data in
        Button {
          store.dispatch(.selectToSearch(text: data))
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
    ForEach(store.state.suggestions, id: \.self) { suggestion in
      HStack(spacing: 0) {
        Text("")  // Image가 가장 앞에 있으면 Divider가 살짝 잘리는 이슈 때문에 추가함.

        Image(systemName: "magnifyingglass")
          .padding(.trailing, 8)
        Text(suggestion)
      }
      .onTapGesture {
        store.dispatch(.selectToSearch(text: suggestion))
      }
    }
    .listStyle(.plain)
  }

  private func stateView(text: String, imageName: String) -> some View {
    VStack {
      Image(systemName: imageName)
        .resizable()
        .frame(width: 80, height: 80)
        .padding(.bottom)

      Text(text)
        .multilineTextAlignment(.center)
        .font(.title2)
        .fontWeight(.bold)
    }
  }

  private var errorStateView: some View {
    stateView(
      text: "에러가 발생했어요.",
      imageName: "xmark.app"
    )
  }

  private var emptyStateView: some View {
    stateView(
      text: "결과값이 없어요.\n다른 검색어로 검색해주세요.",
      imageName: "nosign.app"
    )
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
      .environmentObject(
        Store(reducer: SearchReducer())
      )
  }
}

