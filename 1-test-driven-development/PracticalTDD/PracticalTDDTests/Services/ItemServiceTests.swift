//
//  ItemServiceTests.swift
//  PracticalTDDTests
//
//  Created by Mehmet Tarhan on 27/02/2022.
//

import XCTest

@testable import PracticalTDD

class ItemServiceTests: XCTestCase {
    func testGettingItems() {
        let service = ItemService(isTest: true)
        var expectedItems: [Item]!
        
        let expectation = self.expectation(description: "testGettingItems")
        service.getItems { items in
            expectedItems = items
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(expectedItems.count, 3)
    }
}
