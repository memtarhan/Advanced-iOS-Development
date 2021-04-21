//
//  MovieManagerTests.swift
//  MovieLandTests
//
//  Created by Mehmet Tarhan on 4.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

@testable import MovieLand
import XCTest

class MovieManagerTests: XCTestCase {
    private var systemUnderTest: MovieManager!

    let movie1 = Movie(title: "Django Unchained")
    let movie2 = Movie(title: "Jackie Brown")
    let movie3 = Movie(title: "Kill Bill: Vol.1")
    let movie4 = Movie(title: "Kill Bill: Vol.2")

    override func setUpWithError() throws {
        systemUnderTest = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Initial Values

    func testInitMoviesToSeeReturnsZero() {
        XCTAssertEqual(systemUnderTest.moviesToSeeCount, 0)
    }

    func testInitMoviesSeenReturnsZero() {
        XCTAssertEqual(systemUnderTest.moviesSeenCount, 0)
    }

    // MARK: Add & Query

    func testAddMoviesToSeeReturnsOne() {
        systemUnderTest.add(movie: movie1)

        XCTAssertEqual(systemUnderTest.moviesToSeeCount, 1)
    }

    func testQueryReturnsMovieAtIndex() {
        systemUnderTest.add(movie: movie2)

        let movieQueried = systemUnderTest.movieToSee(atIndex: 0)
        XCTAssertEqual(movie2.title, movieQueried.title)
    }

    // MARK: - Checking off

    func testCheckOffMovieUpdateCounts() {
        systemUnderTest.add(movie: movie3)
        systemUnderTest.checkOffMovie(atIndex: 0)

        XCTAssertEqual(systemUnderTest.moviesToSeeCount, 0)
        XCTAssertEqual(systemUnderTest.moviesSeenCount, 1)
    }

    func testCheckOffMovieRemovesMovieFromArray() {
        systemUnderTest.add(movie: movie1)
        systemUnderTest.add(movie: movie2)
        systemUnderTest.add(movie: movie3)

        systemUnderTest.checkOffMovie(atIndex: 0)

        XCTAssertEqual(systemUnderTest.movieToSee(atIndex: 0).title, movie2.title)
    }

    func testCheckOffMovieReturnsMovieAtIndex() {
        systemUnderTest.add(movie: movie1)

        systemUnderTest.checkOffMovie(atIndex: 0)

        let movieQueried = systemUnderTest.checkedOffMovie(atIndex: 0)
        XCTAssertEqual(movie1.title, movieQueried.title)
    }

    func testClearArraysReturnsArrayCountsOfZero() {
        systemUnderTest.add(movie: movie1)
        systemUnderTest.add(movie: movie2)
        systemUnderTest.add(movie: movie3)

        systemUnderTest.checkOffMovie(atIndex: 0)

        XCTAssertEqual(systemUnderTest.moviesToSeeCount, 2)
        XCTAssertEqual(systemUnderTest.moviesSeenCount, 1)

        systemUnderTest.clearArrays()

        XCTAssertEqual(systemUnderTest.moviesToSeeCount, 0)
        XCTAssertEqual(systemUnderTest.moviesSeenCount, 0)
    }

    // MARK: - Duplicates

    func testDuplicateMoviesShouldNotAddedToArray() {
        systemUnderTest.add(movie: movie1)
        systemUnderTest.add(movie: movie1)

        XCTAssertEqual(systemUnderTest.moviesToSeeCount, 1)
    }
}
