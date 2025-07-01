//
//  ShopDealsViewModel.swift
//  ShopDeals
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import Foundation

@MainActor
class ShopDealsViewModel: ObservableObject {
    @Published var shopDealsModel: [ShopDealsModel] = []
    @Published var isLoading = false
    @Published var error: String? = nil
    @Published var searchText: String = ""
    var service = ShopDealsService()
    var filteredDeals: [ShopDealsModel] {
        if searchText.isEmpty { return shopDealsModel }
        return shopDealsModel.filter { deal in
            deal.title.localizedCaseInsensitiveContains(searchText)
            || deal.topDescription?.localizedCaseInsensitiveContains(searchText) == true
            || deal.promoMessage?.localizedCaseInsensitiveContains(searchText) == true
        }
    }
    
    init(service: ShopDealsService = ShopDealsService()) {
        self.service = service
    }
    
    func fetchDeals() async {
        isLoading = true
        error = nil
        defer { isLoading = false }
        
        let result = await service.fetchShopDeals()
        if result.isEmpty {
            self.error = Constants.Strings.emptyDeals
        }
        self.shopDealsModel = result
    }
}
