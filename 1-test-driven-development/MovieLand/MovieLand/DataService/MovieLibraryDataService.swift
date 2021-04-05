//
//  MovieLibraryDataService.swift
//  MovieLand
//
//  Created by Mehmet Tarhan on 5.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import UIKit

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
