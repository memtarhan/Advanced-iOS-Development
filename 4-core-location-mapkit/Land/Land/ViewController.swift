//
//  ViewController.swift
//  Land
//
//  Created by Mehmet Tarhan on 17.04.2021.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var mapTypeButton: UIButton!
    @IBOutlet var pitchButton: UIButton!
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func didTapMapType(_ sender: Any) {
    }

    @IBAction func didTapPitch(_ sender: Any) {
    }

    @IBAction func didTapFeatures(_ sender: Any) {
    }

    @IBAction func didTapHere(_ sender: Any) {
    }

    @IBAction func didTapFind(_ sender: Any) {
    }

    @IBAction func didChangeLocation(_ sender: UISegmentedControl) {
    }
}
