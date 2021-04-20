//
//  AnnotationDetailViewController.swift
//  PizzaHistoryMap
//
//  Created by Steven Lipton on 7/20/17.
//  Copyright © 2017 Steven Lipton. All rights reserved.
//

import MapKit
import UIKit

class AnnotationDetailViewController: UIViewController {
    var annotation: PizzaAnnotation!

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pizzaPhoto: UIImageView!
    @IBOutlet var historyText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = annotation.title
        pizzaPhoto.image = annotation.photo
        historyText.text = annotation.history

        retrievePlacemark(annotation) { placemark in
            if let placemark = placemark {
                var locationString = ""
                if let city = placemark.locality {
                    locationString += "City: \(city) - "
                }
                if let state = placemark.administrativeArea {
                    locationString += "State: \(state) - "
                }
                if let country = placemark.country {
                    locationString += "Country: \(country)"
                }

                print("Placemark: \(locationString)")
            }
        }
    }

    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    func retrievePlacemark(_ annotation: PizzaAnnotation, completionHandler: @escaping (CLPlacemark?) -> Void) {
        let coordinate = annotation.coordinate
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemarks = placemarks {
                completionHandler(placemarks.first)

            } else {
                completionHandler(nil)
                print("Error on Geocoder: \(error!.localizedDescription)")
            }
        }
    }
}
