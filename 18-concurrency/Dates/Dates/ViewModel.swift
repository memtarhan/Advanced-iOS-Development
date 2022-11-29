//
//  ViewModel.swift
//  Dates
//
//  Created by Mehmet Tarhan on 29/11/2022.
//

import Combine
import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var dates = [CurrentDate]()

    func loadCurrentDate() async {
        if let date = try? await WebService.getCurrentDate() {
            dates.append(date)
        }
    }
}

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    let week: Int
    let dayOfYear: Int

    private enum CodingKeys: String, CodingKey {
        case date = "utc_datetime"
        case week = "week_number"
        case dayOfYear = "day_of_year"
    }
}
