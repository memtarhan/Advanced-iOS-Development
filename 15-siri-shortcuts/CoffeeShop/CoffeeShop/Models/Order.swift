//
//  Order.swift
//  CoffeeShop
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import Foundation

enum CoffeeSize: Int {
    case small = 0
    case medium = 1
    case large = 2
}

class Order {
    var identifier: UUID = UUID()
    var coffee: Coffee
    var total: Double
    var size: CoffeeSize

    init(coffee: Coffee, total: Double, size: CoffeeSize = .medium, identifier: UUID = UUID()) {
        self.coffee = coffee
        self.total = total
        self.size = size
        self.identifier = identifier
    }
}

extension Order {
    func toDictionary() -> [String: Any] {
        return ["name": coffee.name, "imageURL": coffee.imageURL,
                "total": total, "coffeeSize": size.rawValue]
    }
}
