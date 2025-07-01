//
//  ShopDealsViewModelTest.swift
//  ShopDealsTests
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import XCTest
@testable import ShopDeals

final class ShopDealsViewModelTests: XCTestCase {
    
    func testFetchDeals() async {
        let mockDeals = [
            ShopDealsModel(
                title: "Test Deal",
                backgroundImage: "http://deal.com/image.jpg",
                content: nil,
                promoMessage: "DEAL123",
                topDescription: "Test top",
                bottomDescription: "Test bottom"
            )
        ]
        let mockService = MockShopDealsService()
        mockService.mockResult = mockDeals
        let viewModel = await ShopDealsViewModel(service: mockService)

        await viewModel.fetchDeals()

        await MainActor.run {
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertNil(viewModel.error)
            XCTAssertEqual(viewModel.shopDealsModel.count, 1)
            XCTAssertEqual(viewModel.shopDealsModel.first?.title, "Test Deal")
        }
    }

    func testFetchDealsWithEmptyResult() async {
        let mockService = MockShopDealsService()
        mockService.mockResult = []
        let viewModel = await ShopDealsViewModel(service: mockService)

        await viewModel.fetchDeals()

        await MainActor.run {
            XCTAssertEqual(viewModel.error, "No deals found.")
        }
    }
}
