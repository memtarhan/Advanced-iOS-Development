//
//  PizzaAnnotation.swift
//  Land
//
//  Created by Mehmet Tarhan on 18.04.2021.
//  Copyright © 2021 MEMTARHAN. All rights reserved.
//

import MapKit
import UIKit

class PizzaAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var identifier = "Pin"
    var history = ""

    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
