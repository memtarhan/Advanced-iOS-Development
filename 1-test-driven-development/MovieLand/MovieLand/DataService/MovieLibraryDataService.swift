//
//  MovieLibraryDataService.swift
//  MovieLand
//
//  Created by Mehmet Tarhan on 5.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import UIKit

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    var movieManager: MovieManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else { return 0 }
        return movieManager.moviesToSeeCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
