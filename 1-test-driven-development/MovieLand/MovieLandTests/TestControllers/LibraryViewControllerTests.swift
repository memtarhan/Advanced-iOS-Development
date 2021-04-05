//
//  LibraryViewControllerTests.swift
//  MovieLandTests
//
//  Created by Mehmet Tarhan on 5.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

@testable import MovieLand
import XCTest

class LibraryViewControllerTests: XCTestCase {
    var systemUnderTest: LibraryViewController!

    override func setUpWithError() throws {
        systemUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = systemUnderTest.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Nil Checks

    func testLibraryVCTableViewShouldNotBeNil() {
        XCTAssertNotNil(systemUnderTest.tableView)
    }

    // MARK: - Data Source

    func testDataSourceViewDidLoadSetTableViewDataSource() {
        XCTAssertNotNil(systemUnderTest.tableView.dataSource)
        XCTAssertTrue(systemUnderTest.tableView.dataSource is MovieLibraryDataService)
    }

    // MARK: - Delegate

    func testDelegateViewDidLoadSetTableViewDelegate() {
        XCTAssertNotNil(systemUnderTest.tableView.delegate)
        XCTAssertTrue(systemUnderTest.tableView.delegate is MovieLibraryDataService)
    }

    // MARK: - Data Service Assumptions

    func testDataServiceViewDidLoadSingleDataServiceObject() {
        XCTAssertEqual(systemUnderTest.tableView.dataSource as! MovieLibraryDataService, systemUnderTest.tableView.delegate as! MovieLibraryDataService)
    }
}
