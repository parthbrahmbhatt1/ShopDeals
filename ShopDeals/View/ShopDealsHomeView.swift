//
//  ShopDealsHomeView.swift
//  ShopDeals
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import SwiftUI

struct ShopDealsHomeView: View {
    @StateObject var viewModel = ShopDealsViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.filteredDeals.isEmpty {
                    VStack {
                        if !viewModel.searchText.isEmpty {
                            Text(Constants.Strings.emptyDeals)
                                .foregroundColor(.secondary)
                                .font(.headline)
                        } else if let error = viewModel.error {
                            Text(error)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.filteredDeals) { shopDeals in
                                NavigationLink(value: shopDeals) {
                                    ShopDealsView(shopDealsModel: shopDeals)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .background(Color.white)
                        }
                    }
                }
            }
            .navigationTitle(Constants.Strings.deals)
            .navigationDestination(for: ShopDealsModel.self) { shopDeals in
                ShopDealsDetailView(shopDealsModel: shopDeals)
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: Constants.Strings.searchDeals)
        .task {
            await viewModel.fetchDeals()
        }
    }
}
