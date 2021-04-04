//
//  MovieManager.swift
//  MovieLand
//
//  Created by Mehmet Tarhan on 4.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int {
        return moviesToSee.count
    }

    var moviesSeenCount: Int {
        return moviesSeen.count
    }

    private var moviesToSee = [Movie]()
    private var moviesSeen = [Movie]()

    func add(movie: Movie) {
        if !moviesToSee.contains(movie) {
            moviesToSee.append(movie)
        }
    }

    func movieToSee(atIndex index: Int) -> Movie {
        return moviesToSee[index]
    }

    func checkOffMovie(atIndex index: Int) {
        guard index < moviesToSeeCount else { return }

        let checkedOffMovie = moviesToSee.remove(at: index)
        moviesSeen.append(checkedOffMovie)
    }

    func checkedOffMovie(atIndex index: Int) -> Movie {
        return moviesSeen[index]
    }

    func clearArrays() {
        moviesToSee.removeAll()
        moviesSeen.removeAll()
    }
}
