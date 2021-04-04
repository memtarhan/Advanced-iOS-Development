//
//  Movie.swift
//  MovieLand
//
//  Created by Mehmet Tarhan on 4.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
