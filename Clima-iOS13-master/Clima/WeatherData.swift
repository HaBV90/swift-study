//
//  WeatherData.swift
//  Clima
//
//  Created by HaBV on 29/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
