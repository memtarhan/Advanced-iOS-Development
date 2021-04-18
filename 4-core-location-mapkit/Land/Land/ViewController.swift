//
//  ViewController.swift
//  Land
//
//  Created by Mehmet Tarhan on 17.04.2021.
//

/* --- Coordinate information -----
            Lat,long
 Naples: 40.8367321,14.2468856
 New York: 40.7216294 , -73.995453
 Chicago: 41.892479 , -87.6267592
 Chatham: 42.4056555,-82.1860369
 Beverly Hills: 34.0674607,-118.3977309

 -->Challenges!!<----
 208 S. Beverly Drive Beverly Hills CA:34.0647691,-118.3991328
 2121 N. Clark St Chicago IL: 41.9206921,-87.6375361

 For region monitoring:
 latitude: 37.33454235, longitude: -122.03666775000001
 --- */

import MapKit
import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet var mapTypeButton: UIButton!
    @IBOutlet var pitchButton: UIButton!
    @IBOutlet var mapView: MKMapView!

    // MARK: - Properties

    var coordinate2D = CLLocationCoordinate2DMake(40.8367321, 14.2468856)
    var camera = MKMapCamera()
    var pitch = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        updateMapRegion(rangeSpan: 100)
    }

    // MARK: - Actions

    @IBAction func didTapMapType(_ sender: Any) {
    }

    @IBAction func didTapPitch(_ sender: UIButton) {
        pitch = (pitch + 15) % 90
        sender.setTitle("\(pitch)°", for: .normal)
        mapView.camera.pitch = CGFloat(pitch)
    }

    @IBAction func didTapFeatures(_ sender: Any) {
    }

    @IBAction func didTapHere(_ sender: Any) {
    }

    @IBAction func didTapFind(_ sender: Any) {
    }

    @IBAction func didChangeLocation(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex

        switch index {
        case 0: // Naples
            coordinate2D = CLLocationCoordinate2DMake(40.8367321, 14.2468856)
        case 1: // New York
            coordinate2D = CLLocationCoordinate2DMake(40.7216294, -73.995453)
            updateMapCamera(heading: 90, altitude: 250.0)
            return
        case 2: // Chicago
            coordinate2D = CLLocationCoordinate2DMake(41.892479, -87.6267592)
            updateMapCamera(heading: 90, altitude: 2.0)
            return
        case 3: // Chatham
            coordinate2D = CLLocationCoordinate2DMake(42.4056555, -82.1860369)
        case 4: // Beverly Hills
            coordinate2D = CLLocationCoordinate2DMake(34.0674607, -118.3977309)
        default: // Naples
            coordinate2D = CLLocationCoordinate2DMake(40.8367321, 14.2468856)
        }

        updateMapRegion(rangeSpan: 100)
    }

    // MARK: Instance Methods

    func updateMapRegion(rangeSpan: CLLocationDistance) {
        let region = MKCoordinateRegion(center: coordinate2D, latitudinalMeters: rangeSpan, longitudinalMeters: rangeSpan)
        mapView.region = region
    }

    func updateMapCamera(heading: CLLocationDirection, altitude: CLLocationDistance) {
        camera.centerCoordinate = coordinate2D
        camera.altitude = altitude
        camera.heading = heading
        camera.pitch = 0.0
        mapView.camera = camera
        pitchButton.setTitle("\(0)°", for: .normal)
    }
}
