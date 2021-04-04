//
//  MovieStructTests.swift
//  MovieLandTests
//
//  Created by Mehmet Tarhan on 4.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

@testable import MovieLand
import XCTest

class MovieStructTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitMovieWithTitle() {
        let movie = Movie(title: "Django Unchained")

        // - Assertions

        /// * Not nil
        XCTAssertNotNil(movie)

        /// * Equal
        XCTAssertEqual(movie.title, "Django Unchained")
    }

    func testInitMovieWithTitleAndReleaseDate() {
        let movie = Movie(title: "Django Unchained", releaseDate: "2012")

        // - Assertions

        /// * Not nil
        XCTAssertNotNil(movie)

        /// * Equal
        XCTAssertEqual(movie.releaseDate, "2012")
    }
}
