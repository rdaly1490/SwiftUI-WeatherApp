//
//  Weather.swift
//  WeatherApp
//
//  Created by Rob on 7/27/20.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: WeatherStats
    let weather: Weather
}

struct WeatherStats: Decodable {
    var temp: Double?
    var humidity: Double?
}

struct Weather: Decodable {
    var id: Int?
}

