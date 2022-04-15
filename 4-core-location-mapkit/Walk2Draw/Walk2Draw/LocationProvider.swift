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

    private let updateHandler: (CLLocation) -> Void

    private(set) var updating = false
    /*
     With private(set), we tell the compiler that this property can be changed only from within the class it belongs to. From outside of this class, the property behaves like a constant.
     */
    init(updateHandler: @escaping (CLLocation) -> Void) {
        locationManager = CLLocationManager()
        self.updateHandler = updateHandler

        super.init()

        locationManager.delegate = self
        locationManager.distanceFilter = 1
        locationManager.requestWhenInUseAuthorization()
    }

    func start() {
        locationManager.startUpdatingLocation()
        updating = true
        locationManager.allowsBackgroundLocationUpdates = true
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
        updating = false
        locationManager.allowsBackgroundLocationUpdates = false 
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
        guard let location = locations.last else { return }
        updateHandler(location)
        /*
         locationManager(_:didUpdateLocations:) provides the delegate with measured locations. From all the measured locations we need only one; that’s why we call last on the locations array. Most of the time the locationManager will provide only one location. But if there’s more than one location delivered in the array, the last one is the most accurate because the user might have moved in the meantime.
         */
    }
}
