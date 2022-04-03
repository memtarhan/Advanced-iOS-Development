//
//  HomeViewModel.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import CoreLocation
import Foundation

class HomeViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var temperature: String = ""
    @Published var feelsLike: String = ""
    @Published var condition: String = ""
    @Published var highTemperature: String = "H:17°"
    @Published var lowTemperature: String = "L:7°"
    @Published var humidity: String = ""

    private let service: WeatherService

    init() {
        service = WeatherService()
    }

    func fetch() {
        let city = "Patnos"
        service.fetch(for: city) { result in
            switch result {
            case let .success(weather):
                let temperature = Int((weather.main?.temp!)!)
                let feelsLike = Int((weather.main?.feelsLike!)!)
                let condition = weather.weather?.first?.main ?? ""
                let humidity: Int = weather.main!.humidity!
                DispatchQueue.main.async {
                    self.city = weather.name!
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

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var location: CLLocation?

    private let locationManager: CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        super.init()
    }

    func trigger() {
        authorizationStatus = locationManager.authorizationStatus
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        DispatchQueue.main.async {
            self.location = locations.last
        }
    }
}
