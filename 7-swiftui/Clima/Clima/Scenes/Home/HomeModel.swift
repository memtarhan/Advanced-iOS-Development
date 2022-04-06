//
//  HomeModel.swift
//  Clima
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import Foundation

struct HomeModel {
    struct SunriseSet {
        let sunrise: String
        let sunset: String
    }

    struct Hourly {
        let time: String
        let icon: String
        let temp: String
    }
}
