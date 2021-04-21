//
//  MovieLibraryDataServiceTests.swift
//  MovieLandTests
//
//  Created by Mehmet Tarhan on 21.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import MovieLand
import XCTest

class MovieLibraryDataServiceTests: XCTestCase {
    var systemUnderTest: MovieLibraryDataService!
    var tableView: UITableView!

    let fairyTale = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        systemUnderTest = MovieLibraryDataService()
        systemUnderTest.movieManager = MovieManager()
        
        tableView = UITableView()
        tableView.dataSource = systemUnderTest
        tableView.delegate = systemUnderTest
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Sections

    func testTableViewSectionsCountReturnsTwo() {
        let sections = tableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }

    func testTableViewSectionsSectionOneReturnsMoviesToSeeCount() {
        systemUnderTest.movieManager?.add(movie: fairyTale)
        systemUnderTest.movieManager?.add(movie: darkComedy)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
        systemUnderTest.movieManager?.add(movie: thriller)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSectionsSectionTwoReturnsMoviesSeenCount() {
        systemUnderTest.movieManager?.add(movie: fairyTale)
        systemUnderTest.movieManager?.add(movie: darkComedy)
        
        systemUnderTest.movieManager?.checkOffMovie(atIndex: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        systemUnderTest.movieManager?.checkOffMovie(atIndex: 0)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
}
