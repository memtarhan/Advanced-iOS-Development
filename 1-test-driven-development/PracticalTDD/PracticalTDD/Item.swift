//
//  Item.swift
//  PracticalTDD
//
//  Created by Mehmet Tarhan on 27/02/2022.
//

import Foundation

struct Item {
    var id: String
    var title: String
    var isCompleted: Bool = false

    mutating func complete() {
        isCompleted = true
    }
}
