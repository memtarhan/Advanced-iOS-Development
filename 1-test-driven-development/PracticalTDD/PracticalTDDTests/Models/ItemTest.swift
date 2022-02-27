//
//  ItemTest.swift
//  PracticalTDDTests
//
//  Created by Mehmet Tarhan on 27/02/2022.
//

import XCTest

@testable import PracticalTDD

class ItemTest: XCTestCase {
    func testItemCompletion() throws {
        var item = Item(id: "TestId", title: "Test Title")
        
        XCTAssertEqual(item.isCompleted, false)
        
        item.complete()
        
        XCTAssertEqual(item.isCompleted, true)
    }
}
