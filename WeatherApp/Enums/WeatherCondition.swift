//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Rob on 7/28/20.
//

import Foundation

enum WeatherCondition: Int {
    case Unknown = 1
    case Thunderstorm = 2
    case Drizzle = 3
    case Rain = 4
    case Snow = 5
    case Fog = 6
    case Clear = 7
    case Clouds = 8
}

extension WeatherCondition {
    init(id: Int) {
        var weatherType = WeatherCondition.Unknown
            switch id {
            case 200...299:
                weatherType = WeatherCondition.Thunderstorm
            case 300...399:
                weatherType = WeatherCondition.Drizzle
            case 500...599:
                weatherType = WeatherCondition.Rain
            case 600...699:
                weatherType = WeatherCondition.Snow
            case 741:
                weatherType = WeatherCondition.Fog
            case 800:
                weatherType = WeatherCondition.Clear
            case 801...900:
                weatherType = WeatherCondition.Clouds
            default:
                weatherType = WeatherCondition.Unknown
            }
        
        self.init(rawValue: weatherType.rawValue)!
    }
}
