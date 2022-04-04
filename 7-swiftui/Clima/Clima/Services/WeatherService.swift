//
//  WeatherService.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import CoreLocation
import Foundation

private enum API {
    static let apiKey = "507cf4e20f94c76ef6efffc0851f7946"
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
//    static let baseURL = "https://api.openweathermap.org/data/2.5/weather?"

    // https://api.openweathermap.org/data/2.5/onecall?lat=40.64&lon=-8.65&exclude=minutely&appid=507cf4e20f94c76ef6efffc0851f7946
    // http://openweathermap.org/img/w/01d.png
}

class WeatherService {
    func fetch(for location: CLLocation, _ completionHandler: @escaping (Result<WeatherResponse, WeatherError>) -> Void) {
        let endpoint = "\(API.baseURL)onecall?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&exclude=minutely&units=metric&appid=\(API.apiKey)"

        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let endpointURL = URL(string: safeURLString) else {
            completionHandler(.failure(.invalidURL(endpoint)))
            return
        }

        let dataTask = URLSession.shared.dataTask(with: endpointURL) { data, _, error in
            guard error == nil else {
                completionHandler(.failure(.forwarded(error!)))

                return
            }

            guard let responseData = data else {
                completionHandler(.failure(.invalidPayload(endpointURL)))
                return
            }

            let decoder = JSONDecoder()
            do {
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: responseData)
                completionHandler(.success(weatherResponse))

            } catch {
                completionHandler(.failure(.forwarded(error)))
            }
        }

        dataTask.resume()
    }

    func fetch(for city: String, _ completionHandler: @escaping (Result<WeatherResponse, WeatherError>) -> Void) {
        let endpoint = "\(API.baseURL)weather?q=\(city)&units=metric&appid=\(API.apiKey)"

        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let endpointURL = URL(string: safeURLString) else {
            completionHandler(.failure(.invalidURL(endpoint)))
            return
        }

        let dataTask = URLSession.shared.dataTask(with: endpointURL) { data, _, error in
            guard error == nil else {
                completionHandler(.failure(.forwarded(error!)))

                return
            }

            guard let responseData = data else {
                completionHandler(.failure(.invalidPayload(endpointURL)))
                return
            }

            let decoder = JSONDecoder()
            do {
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: responseData)
                completionHandler(.success(weatherResponse))

            } catch {
                completionHandler(.failure(.forwarded(error)))
            }
        }

        dataTask.resume()
    }
}

enum WeatherError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}
