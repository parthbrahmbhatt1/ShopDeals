//
//  ShopDealsHomeViewUITests.swift
//  ShopDealsUITests
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import Foundation
import XCTest

final class ShopDealsHomeViewUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testHomeViewLoadsAndShowsTitle() throws {
        let app = XCUIApplication()
        let dealsTitle = app.staticTexts["Deals"]
        let exists = dealsTitle.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "Deals title should appear on the home screen")
    }
    
    func testDealsListScrolls() throws {
        let app = XCUIApplication()
        let dealsList = app.scrollViews.firstMatch
        
        if dealsList.exists {
            dealsList.swipeUp()
        }
    }
}
