//
//  ShopDealsService.swift
//  ShopDeals
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import Foundation

class ShopDealsService {
    
    func fetchShopDeals() async -> [ShopDealsModel] {
        
        guard let url = URL(string: Constants.API.apiURL) else {
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let deals = try JSONDecoder().decode([ShopDealsModel].self, from: data)
            return deals
        } catch {
            print("\(Constants.Strings.error) \(error.localizedDescription)")
            return []
        }
    }
}
