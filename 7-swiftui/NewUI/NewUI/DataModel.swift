//
//  DataModel.swift
//  NewUI
//
//  Created by Mehmet Tarhan on 27.05.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import Foundation

struct TableData: Hashable {
    var id: Int
    var title: String
    var detail: String
}

class DataModel: NSObject {
    static let data = [
        TableData(id: 0, title: "London", detail: "England"),
        TableData(id: 1, title: "Barcelona", detail: "Spain"),
        TableData(id: 2, title: "Lisbon", detail: "Portugal"),
        TableData(id: 3, title: "Milan", detail: "Italy"),
    ]
}
