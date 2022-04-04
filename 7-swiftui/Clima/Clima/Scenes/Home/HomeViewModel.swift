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

    @Published var shouldShowHourly: Bool = false
    @Published var hourly: [HomeModel.Hourly] = []

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
                let temperature = Int(weather.current?.temp! ?? 0)
                let feelsLike = Int((weather.current?.feelsLike!)!)
                let condition = weather.current?.weather?.first?.main ?? ""
                let humidity: Int = weather.current!.humidity!
                DispatchQueue.main.async {
                    self.temperature = "\(temperature)°"
                    self.feelsLike = "\(feelsLike)°"
                    self.condition = condition
                    self.humidity = "\(humidity)"
                    self.hourly = weather.hourly?.map({ hourly in
                        let temp = Int(hourly.temp ?? 0)
                        let icon = hourly.weather?.first?.icon ?? "01d"
                        let timeInterval = TimeInterval(hourly.dt ?? 0)
                        let date = Date(timeIntervalSince1970: timeInterval)
                        return HomeModel.Hourly(time: date.asHourly, icon: icon, temp: "\(temp)°")
                    }) ?? []

                    self.shouldShowHourly = true
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

extension Date {
    var asHourly: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: self)
    }
}
