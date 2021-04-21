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
    var heading = 0.0
    let onRampCoordinate = CLLocationCoordinate2DMake(37.3346, -122.0345)
    var startMapItem = MKMapItem()
    var destinationMapItem = MKMapItem()

    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self

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
        disableLocationServices()
//        mapView.showsBuildings = isOn
//        isOn = !isOn
        isOn = !mapView.showsBuildings
        mapView.showsBuildings = isOn
        mapView.showsScale = isOn
        mapView.showsCompass = isOn
        mapView.showsTraffic = isOn
    }

    @IBAction func didTapHere(_ sender: Any) {
        setupCoreLocation()
    }

    @IBAction func didTapFind(_ sender: Any) {
//        let address = "2121 N. Clart St. IL"
//        getCoordinate(forAddress: address) { coordinate, _, _ in
//            if let coordinate = coordinate {
//                print("Location: getCoordinate: \(coordinate)")
//                self.mapView.camera.centerCoordinate = coordinate
//                self.mapView.camera.altitude = 1000.0
//                let pin = PizzaAnnotation(coordinate: coordinate, title: address, subtitle: "\(coordinate)")
//                self.mapView.addAnnotation(pin)
//            }
//        }

//        let request = MKLocalSearch.Request()
//        request.naturalLanguageQuery = "Pizza"
//        updateMapRegion(rangeSpan: 500)
//        request.region = mapView.region
//        let search = MKLocalSearch(request: request)
//        search.start { response, error in
//            if let error = error {
//                print("Location: Error while searching: \(error.localizedDescription)")
//
//            } else if let response = response {
//                for mapItem in response.mapItems {
//                    let placemark = mapItem.placemark
//                    let name = mapItem.name
//                    let coordinate = placemark.coordinate
//                    let streetAddress = placemark.thoroughfare
//                    let annotation = PizzaAnnotation(coordinate: coordinate, title: name, subtitle: streetAddress)
//                    self.mapView.addAnnotation(annotation)
//                }
//            }
//        }

        let annotations = PizzaHistoryAnnotations().annotations
        let spgo = annotations[5].coordinate
        let cpk = annotations[6].coordinate
        let cpog = annotations[4].coordinate
        let uno = annotations[2].coordinate

        findDirections(start: spgo, destination: cpk)
        findDirections(start: cpog, destination: uno)
    }

    @IBAction func didChangeLocation(_ sender: UISegmentedControl) {
        disableLocationServices()

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

    // MARK: - Location

    func setupCoreLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break

        case .authorizedAlways:
            enableLocationServices()
        default:
            break
        }
    }

    func enableLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            mapView.setUserTrackingMode(.follow, animated: true)

        } else {
            print("Location: CLLocationManager.locationServicesDisabled()")
        }

        if CLLocationManager.headingAvailable() {
            locationManager.startUpdatingHeading()

        } else {
            print("Location: CLLocationManager.headingNotAvailable()")
        }

        monitorRegion(onRampCoordinate, radius: 100, id: "monitor_region")
    }

    func disableLocationServices() {
        locationManager.stopUpdatingLocation()
    }

    func monitorRegion(_ center: CLLocationCoordinate2D, radius: CLLocationDistance, id: String) {
        if locationManager.authorizationStatus == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
                let region = CLCircularRegion(center: center, radius: radius, identifier: id)
                region.notifyOnExit = true
                region.notifyOnEntry = true
                locationManager.startMonitoring(for: region)
            }
        } else {
            print("Location: cannot monitor region in background")
        }
    }

    // MARK: - Find

    func getCoordinate(forAddress address: String, _ completionHandler: @escaping (CLLocationCoordinate2D?, String, NSError?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let error = error {
                completionHandler(nil, "", error as NSError)

            } else {
                if let placemark = placemarks?.first {
                    let coordinate = placemark.location?.coordinate
                    let location = "\(placemark.locality!) \(placemark.isoCountryCode!)"
                    completionHandler(coordinate, location, nil)
                }
            }
        }
    }

    // MARK: - Directions

    func findDirections(start: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        startMapItem = MKMapItem(placemark: MKPlacemark(coordinate: start))
        destinationMapItem = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        let request = MKDirections.Request()
        request.source = startMapItem
        request.destination = destinationMapItem
        request.requestsAlternateRoutes = true
        request.transportType = .transit

        let directions = MKDirections(request: request)

        if request.transportType == .transit {
            directions.calculateETA { response, error in
                if let error = error {
                    print("Directions: \(error.localizedDescription)")

                } else if let response = response {
                    let annotation = PizzaAnnotation(coordinate: destination, title: "Destination", subtitle: String(format: "%4.2f minutes", response.expectedTravelTime / 60.0))
                    annotation.identifier = "Transit"
                    self.mapView.addAnnotation(annotation)
                }
            }
            return
        }
        directions.calculate { response, error in
            if let error = error {
                print("Directions: \(error.localizedDescription)")

            } else if let response = response {
                let routes = response.routes
                print("Directions: didFindRoutes: \(routes.count)")
                routes.forEach { route in
                    let polyline = route.polyline
                    polyline.title = "Directions"
                    self.mapView.addOverlay(polyline)
                }

                let destination = response.destination.placemark.coordinate
                let route = routes.first!
                var routeDescription = "\(route.name) \(route.expectedTravelTime / 60.0) min \(route.distance / 1609.344) miles "
                let annotation = PizzaAnnotation(coordinate: destination, title: "Destination", subtitle: routeDescription)

                for step in route.steps {
                    routeDescription += step.instructions + ". Go \(step.distance / 1609.344) mi \n"
                    self.mapView.addOverlay(step.polyline)
                }
                annotation.history = routeDescription

                self.mapView.addAnnotation(annotation)
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

        if annotation.title == "Destination" {
            annotationView.image = #imageLiteral(resourceName: "destination")

        } else {
            annotationView.image = #imageLiteral(resourceName: "pizza pin")
        }
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
        let annotation = view.annotation as! PizzaAnnotation
        if annotation.identifier == "Transit" {
            destinationMapItem.name = "Pizza Pot Pie"
            startMapItem.name = "Deep Dish Pizza"
            MKMapItem.openMaps(with: [destinationMapItem, startMapItem], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeTransit])
        }

        let destination = AnnotationDetailViewController(nibName: "AnnotationDetailViewController", bundle: nil)
        destination.annotation = view.annotation as? PizzaAnnotation
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
            if polyline.title == "Directions" {
                polylineRenderer.strokeColor = .systemBlue
                polylineRenderer.lineWidth = 8.0
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

// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            print("Location: authorized")
        case .denied, .restricted:
            print("Location: not authorized")
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /*
         NOTES

         There are three primary sensors for finding your coordinates. Cell phone towers, WiFi routers, and finally the GPS which receives satellite signals. They all use different amounts of power and have proportionally different accuracy levels with cell towers being inaccurate and low power to GPS being high power and accurate. Drift occurs from inaccuracy with all of them, but WiFi tends to be the most susceptible to drift issues. Core location doesn't let you pick which one you use, but instead asks you for the amount of accuracy you want.

         */
        if let location = locations.last {
            coordinate2D = location.coordinate
            let speedString = "\(location.speed * 2.23694) mph"
            let headingString = "Heading: \(heading)°"
            let courseString = headingString + " at " + speedString
            print(courseString)
            let displayString = "\(location.timestamp) Coordinate: \(coordinate2D) Altitude: \(location.altitude) meters"
            print("Location: \(displayString)")
            updateMapRegion(rangeSpan: 200)

            let pizzaPin = PizzaAnnotation(coordinate: coordinate2D, title: displayString, subtitle: nil)
            mapView.addAnnotation(pizzaPin)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        heading = newHeading.magneticHeading
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print(#function)
        let circularRegion = region as! CLCircularRegion
        if circularRegion.identifier == "monitor_region" {
            let alert = UIAlertController(title: "Heyyy", message: "You just exit the jungle", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)

            present(alert, animated: true, completion: nil)
        }
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print(#function)
        let circularRegion = region as! CLCircularRegion
        if circularRegion.identifier == "monitor_region" {
            let alert = UIAlertController(title: "Heyyy", message: "You just entered the jungle", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)

            present(alert, animated: true, completion: nil)
        }
    }
}
