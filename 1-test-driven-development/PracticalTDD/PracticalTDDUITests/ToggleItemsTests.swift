//
//  ToggleItemsTests.swift
//  PracticalTDDUITests
//
//  Created by Mehmet Tarhan on 27/02/2022.
//

import XCTest

class ToggleItemsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testToggle() throws {
        // Use recording to get started writing UI tests.
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.children(matching: .cell).matching(identifier: "Complete").element(boundBy: 2).children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        
        let completeCell = tablesQuery.children(matching: .cell).matching(identifier: "Complete").element(boundBy: 0)
        let element = completeCell.children(matching: .other).element(boundBy: 0).children(matching: .other).element
        element.tap()
        
        let element2 = tablesQuery.children(matching: .cell).matching(identifier: "Complete").element(boundBy: 1).children(matching: .other).element(boundBy: 0).children(matching: .other).element
        element2.tap()
        element2.tap()
        element2.tap()
        element2.tap()
        element2.tap()
        element2.tap()
        element2.tap()
        element2.tap()
        element.tap()
        tablesQuery.cells["title-1, 💚"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        completeCell.buttons["Complete"].tap()
        element.tap()
        element.tap()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
