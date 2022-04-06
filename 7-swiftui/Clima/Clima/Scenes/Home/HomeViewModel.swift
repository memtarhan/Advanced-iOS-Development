//
//  HomeViewModel.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import CoreLocation
import Foundation

class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var shouldShowInfo: Bool = false
    @Published var city: String = ""
    @Published var temperature: String = ""
    @Published var condition: String = ""
    @Published var highTemperature: String = "H:17°"
    @Published var lowTemperature: String = "L:7°"

    @Published var humidity: String = ""
    @Published var feelsLike: String = ""
    
    @Published var sunrise: String = ""
    @Published var sunset: String = ""

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

        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()

            return
        }

        locationManager.startUpdatingLocation()
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
        fetch()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }

    func fetch() {
        lookUpCurrentLocation { placemark in
            if let placemark = placemark {
                DispatchQueue.main.async {
                    self.city = placemark.locality ?? "..."
                }
            }
        }
        service.fetch(for: location!) { result in
            switch result {
            case let .success(weather):
                let temperature = Int(weather.current?.temp! ?? 0)
                let feelsLike = Int((weather.current?.feelsLike!)!)
                let condition = weather.current?.weather?.first?.main ?? ""
                let humidity: Int = weather.current!.humidity!
                
                let sunrise: TimeInterval = TimeInterval((weather.current?.sunrise)!)
                let sunset: TimeInterval = TimeInterval((weather.current?.sunset)!)
                
                let hourly: [HomeModel.Hourly] = weather.hourly?.map({ hourly in
                    let temp = Int(hourly.temp ?? 0)
                    let icon = hourly.weather?.first?.icon ?? "01d"
                    let timeInterval = TimeInterval(hourly.dt ?? 0)
                    let date = Date(timeIntervalSince1970: timeInterval)
                    return HomeModel.Hourly(time: date.asHour, icon: icon, temp: "\(temp)°")
                }) ?? []

                DispatchQueue.main.async {
                    self.temperature = "\(temperature)°"
                    self.humidity = "\(humidity)"
                    self.shouldShowInfo = true

                    self.feelsLike = "\(feelsLike)°"
                    self.condition = condition

                    self.sunrise = Date(timeIntervalSince1970: sunrise).asHourAndMinute
                    self.sunset = Date(timeIntervalSince1970: sunset).asHourAndMinute
                    
                    self.hourly = hourly

                    self.shouldShowHourly = true
                }
            case let .failure(error):
                print(error)
            }
        }
    }

    func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)
        -> Void) {
        // Use the last reported location.
        if let lastLocation = locationManager.location {
            let geocoder = CLGeocoder()

            // Look up the location and pass it to the completion handler
            geocoder.reverseGeocodeLocation(lastLocation,
                                            completionHandler: { placemarks, error in
                                                if error == nil {
                                                    let firstLocation = placemarks?[0]
                                                    completionHandler(firstLocation)
                                                } else {
                                                    // An error occurred during geocoding.
                                                    completionHandler(nil)
                                                }
                                            })
        } else {
            // No location was available.
            completionHandler(nil)
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
    var asHour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: self)
    }

    var asHourAndMinute: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
