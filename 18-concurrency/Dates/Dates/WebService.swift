//
//  WebService.swift
//  Dates
//
//  Created by Mehmet Tarhan on 29/11/2022.
//

import Foundation

let baseURL = "https://worldtimeapi.org/api/timezone/Europe/Lisbon"

class WebService {
    static func getCurrentDate() async throws -> CurrentDate? {
        guard let url = URL(string: baseURL) else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}
