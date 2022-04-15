//
//  DrawView.swift
//  Walk2Draw
//
//  Created by Mehmet Tarhan on 14/04/2022.
//

import MapKit
import UIKit

class DrawView: UIView {
    let mapView: MKMapView
    let clearButton: UIButton
    let startStopButton: UIButton
    let shareButton: UIButton

    override init(frame: CGRect) {
        mapView = MKMapView()
        mapView.showsUserLocation = true

        clearButton = UIButton(type: .system)
        clearButton.configuration = .filled()
        clearButton.setTitle("Clear", for: .normal)

        startStopButton = UIButton(type: .system)
        startStopButton.configuration = .filled()
        startStopButton.setTitle("Start", for: .normal)

        shareButton = UIButton(type: .system)
        shareButton.configuration = .filled()
        shareButton.setTitle("Share", for: .normal)

        super.init(frame: frame)

        backgroundColor = .white

        mapView.delegate = self

        let buttonStackView = UIStackView(arrangedSubviews: [clearButton, startStopButton, shareButton])
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 20

        let buttonContainerView = UIView(frame: .zero)
        buttonContainerView.addSubview(buttonStackView)

        let stackView = UIStackView(arrangedSubviews: [mapView, buttonStackView])
        stackView.axis = .vertical
        stackView.spacing = 20
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addOverlay(with locations: [CLLocation]) {
        mapView.removeOverlays(mapView.overlays)

        let coordinates = locations.map { $0.coordinate }
        let overlay = MKPolyline(coordinates: coordinates, count: coordinates.count)
        mapView.addOverlay(overlay)

        guard let lastCoordinate = coordinates.last else { return }
        guard let lastLocation = locations.last else { return }
//        let region = MKCoordinateRegion(center: lastCoordinate, latitudinalMeters: 300, longitudinalMeters: 300)
//        mapView.setRegion(region, animated: true)

        /*
         There’s a lot going on in this code, so let’s break it down. First we remove any overlay that might be on the map from the last call of this method. We need to do this because we can only draw the whole path at once. Next we map the locations array to an array of CLLocationCoordinate2Ds because this is what we need next. Then we create a polyline using these coordinates and add it as an overlay to the map.

         The API for creating an instance of MKPolyline is a glimpse into the past. We need to pass in the array with the coordinates as well as the number of elements in the array. MKPolyline cannot figure out the number of the elements itself because under the hood the initializer gets only a pointer to the memory address of the array. To figure out the size of each element, it also needs the number of elements.

         Finally we set the region of the map such that users can see what they’re drawing.
         */

        let maxDistance = locations.reduce(100) { result, next -> Double in
            let distance = next.distance(from: lastLocation)
            return max(result, distance)
        }

        let region = MKCoordinateRegion(center: lastLocation.coordinate,
                                        latitudinalMeters: maxDistance,
                                        longitudinalMeters: maxDistance)

        mapView.setRegion(region, animated: true)
    }
}

// MARK: - MKMapViewDelegate

extension DrawView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemRed
            renderer.lineWidth = 3
            return renderer

        } else {
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}
