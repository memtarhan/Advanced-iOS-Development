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
    var isOn = false

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.addAnnotations(PizzaHistoryAnnotations().annotations)
        updateMapRegion(rangeSpan: 100)

        addPolylines()
        addDeliveryOverlay()
    }

    // MARK: - Actions

    @IBAction func didTapMapType(_ sender: UIButton) {
        switch mapView.mapType {
        case .standard:
            mapView.mapType = .satellite
        case .satellite:
            mapView.mapType = .hybrid
        case .hybrid:
            mapView.mapType = .satelliteFlyover
        case .satelliteFlyover:
            mapView.mapType = .hybridFlyover
        case .hybridFlyover:
            mapView.mapType = .mutedStandard
        case .mutedStandard:
            mapView.mapType = .standard
        @unknown default:
            mapView.mapType = .standard
        }
    }

    @IBAction func didTapPitch(_ sender: UIButton) {
        pitch = (pitch + 15) % 90
        sender.setTitle("\(pitch)°", for: .normal)
        mapView.camera.pitch = CGFloat(pitch)
    }

    @IBAction func didTapFeatures(_ sender: Any) {
//        mapView.showsBuildings = isOn
//        isOn = !isOn
        isOn = !mapView.showsBuildings
        mapView.showsBuildings = isOn
        mapView.showsScale = isOn
        mapView.showsCompass = isOn
        mapView.showsTraffic = isOn
    }

    @IBAction func didTapHere(_ sender: Any) {
    }

    @IBAction func didTapFind(_ sender: Any) {
    }

    @IBAction func didChangeLocation(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex

//        mapView.removeAnnotations(mapView.annotations)

        switch index {
        case 0: // Naples
            coordinate2D = CLLocationCoordinate2DMake(40.8367321, 14.2468856)
        case 1: // New York
            coordinate2D = CLLocationCoordinate2DMake(40.7216294, -73.995453)
            updateMapCamera(heading: 90, altitude: 2500.0)
//            let pizzaPin = PizzaAnnotation(coordinate: coordinate2D, title: "New York Pizza", subtitle: "Pizza comes to America")
//            mapView.addAnnotation(pizzaPin)
            return
        case 2: // Chicago
            coordinate2D = CLLocationCoordinate2DMake(41.892479, -87.6267592)
            updateMapCamera(heading: 90, altitude: 2000.0)
            return
        case 3: // Chatham
            coordinate2D = CLLocationCoordinate2DMake(42.4056555, -82.1860369)
        case 4: // Beverly Hills
            coordinate2D = CLLocationCoordinate2DMake(34.0674607, -118.3977309)
//            let pizzaPin = MKPointAnnotation()
//            pizzaPin.coordinate = coordinate2D
//            pizzaPin.title = "Fusion Cuisine Pizza"
//            pizzaPin.subtitle = "Also known as California Pizza"
//            mapView.addAnnotation(pizzaPin)
            updateMapCamera(heading: 0, altitude: 1500)

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

    func addPolylines() {
        let annotations = PizzaHistoryAnnotations().annotations
        let beverlyHills1 = annotations[5].coordinate
        let beverlyHills2 = annotations[6].coordinate
        let bhPolyline = MKPolyline(coordinates: [beverlyHills1, beverlyHills2], count: 2)
        bhPolyline.title = "BeverlyHills_Line"
        var coordinates = [CLLocationCoordinate2D]()
        for location in annotations {
            coordinates.append(location.coordinate)
        }
        let grandTour = MKPolyline(coordinates: coordinates, count: coordinates.count)
        grandTour.title = "GrandTour_Line"

        mapView.addOverlays([grandTour, bhPolyline])
    }

    func addDeliveryOverlay() {
//        let radius = 160.0 // meters
        for location in mapView.annotations {
            if let radius = (location as! PizzaAnnotation).deliveryRadius {
                let circle = MKCircle(center: location.coordinate, radius: radius)
                mapView.addOverlay(circle)
            }
        }
    }
}

// MARK: - MKMapViewDelegate

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKAnnotationView()
        guard let annotation = annotation as? PizzaAnnotation else { return nil }
        if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: annotation.identifier) {
            annotationView = dequedView

        } else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotation.identifier)
        }

        annotationView.image = #imageLiteral(resourceName: "pizza pin")
        annotationView.canShowCallout = true

        let paragraph = UILabel()
        paragraph.numberOfLines = 1
        paragraph.font = UIFont.preferredFont(forTextStyle: .caption1)
        paragraph.adjustsFontSizeToFitWidth = true
        paragraph.text = annotation.subtitle
        annotationView.detailCalloutAccessoryView = paragraph

        annotationView.leftCalloutAccessoryView = UIImageView(image: annotation.photo)

        annotationView.rightCalloutAccessoryView = UIButton(type: .infoLight)

        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let destination = AnnotationDetailViewController(nibName: "AnnotationDetailViewController", bundle: nil)
        destination.annotation = view.annotation as? PizzaAnnotation
        destination.modalTransitionStyle = .crossDissolve
        destination.modalPresentationStyle = .popover
        present(destination, animated: true, completion: nil)
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let circle = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(circle: circle)
            circleRenderer.fillColor = UIColor(red: 0.0, green: 0.1, blue: 1.0, alpha: 0.1)
            circleRenderer.strokeColor = .systemBlue
            circleRenderer.lineWidth = 1.0

            return circleRenderer

        } else if let polyline = overlay as? MKPolyline {
            let polylineRenderer = MKPolylineRenderer(polyline: polyline)

            if polyline.title == "GrandTour_Line" {
                polylineRenderer.strokeColor = .systemRed
                polylineRenderer.lineWidth = 5.0
                return polylineRenderer
            }
            polylineRenderer.strokeColor = .systemGreen
            polylineRenderer.lineWidth = 3.0
            polylineRenderer.lineDashPattern = [20, 10, 2, 10]

            return polylineRenderer
        }

        return MKOverlayRenderer(overlay: overlay)
    }
}
