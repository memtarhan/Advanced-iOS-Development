//
//  MovieLibraryDataService.swift
//  MovieLand
//
//  Created by Mehmet Tarhan on 5.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import UIKit

enum LibrarySection: Int {
    case moviesToSee, moviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    var movieManager: MovieManager?

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else { return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }

        switch librarySection {
        case .moviesToSee: return movieManager.moviesToSeeCount
        case .moviesSeen: return movieManager.moviesSeenCount
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
