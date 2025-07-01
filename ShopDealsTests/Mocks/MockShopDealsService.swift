//
//  MockShopDealsService.swift
//  ShopDealsTests
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import Foundation
@testable import ShopDeals

class MockShopDealsService: ShopDealsService {
    var mockResult: [ShopDealsModel] = []
    
    override func fetchShopDeals() async -> [ShopDealsModel] {
        return mockResult
    }
}
