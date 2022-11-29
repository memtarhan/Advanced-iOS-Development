//
//  Coffee.swift
//  CoffeeShop
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import Foundation

struct Coffee {
    var name: String
    var imageURL: String
    var basePrice: Double
}

extension Coffee {
    static func all() -> [Coffee] {
        return [Coffee(name: "Cappuccino", imageURL: "cappuccino", basePrice: 4.50),
                Coffee(name: "Iced Coffee", imageURL: "iced-coffee", basePrice: 3.50),
                Coffee(name: "Regular Coffee", imageURL: "regular-coffee", basePrice: 2.00)]
    }
}
