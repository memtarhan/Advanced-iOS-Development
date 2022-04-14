//
//  LocationProvider.swift
//  Walk2Draw
//
//  Created by Mehmet Tarhan on 14/04/2022.
//

import CoreLocation
import Foundation
import LogStore

class LocationProvider: NSObject {
    private let locationManager: CLLocationManager

    override init() {
        locationManager = CLLocationManager()

        super.init()

        locationManager.delegate = self
        locationManager.distanceFilter = 1
        locationManager.requestWhenInUseAuthorization()
    }

    func start() {
        locationManager.startUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate

extension LocationProvider: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            printLog("success")
        case .denied:
            printLog("denied")
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        printLog("locations: \(locations)")
    }
}
