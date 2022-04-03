//
//  HomeViewModel.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var temperature: String = ""
    @Published var condition: String = ""
    @Published var highTemperature: String = "H:17°"
    @Published var lowTemperature: String = "L:7°"

    private let service: WeatherService

    init() {
        service = WeatherService()
    }

    func fetch() {
        let city = "Aveiro"
        service.fetch(for: city) { result in
            switch result {
            case let .success(weather):
                let temperature = Int(weather.main.temp)
                let condition = weather.weather.first?.main ?? ""
                DispatchQueue.main.async {
                    self.city = weather.name
                    self.temperature = "\(temperature)°"
                    self.condition = condition
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
