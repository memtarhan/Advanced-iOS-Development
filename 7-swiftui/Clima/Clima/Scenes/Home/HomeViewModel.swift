//
//  HomeViewModel.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import CoreLocation
import Foundation

class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var city: String = ""
    @Published var temperature: String = ""
    @Published var feelsLike: String = ""
    @Published var condition: String = ""
    @Published var highTemperature: String = "H:17°"
    @Published var lowTemperature: String = "L:7°"
    @Published var humidity: String = ""

    private let service: WeatherService
    private let locationManager: CLLocationManager

    private var location: CLLocation?

    override init() {
        service = WeatherService()
        locationManager = CLLocationManager()

        super.init()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func trigger() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
        fetch()
    }

    func fetch() {
        service.fetch(for: location!) { result in
            switch result {
            case let .success(weather):
                print(weather)
                let temperature = Int((weather.current?.temp! ?? 0))
                let feelsLike = Int((weather.current?.feelsLike!)!)
                let condition = weather.current?.weather?.first?.main ?? ""
                let humidity: Int = weather.current!.humidity!
                DispatchQueue.main.async {
                    self.temperature = "\(temperature)°"
                    self.feelsLike = "\(feelsLike)°"
                    self.condition = condition
                    self.humidity = "\(humidity)"
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

// class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
//    @Published var authorizationStatus: CLAuthorizationStatus?
//    @Published var location: CLLocation?
//
//    private let locationManager: CLLocationManager
//
//    override init() {
//        locationManager = CLLocationManager()
//        super.init()
//    }
//
//    func trigger() {
//        authorizationStatus = locationManager.authorizationStatus
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        DispatchQueue.main.async {
//            self.location = locations.last
//        }
//    }
// }
