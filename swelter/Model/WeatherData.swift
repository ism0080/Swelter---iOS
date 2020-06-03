//
//  WeatherData.swift
//  swelter
//
//  Created by Isaac Mackle on 4/6/20.
//  Copyright © 2020 Isaac Mackle. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let sys: Sys
    let wind: Wind
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}

struct Sys: Codable {
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let country: String
}

struct Wind: Codable {
    let speed: Int
}
