//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Rob on 7/27/20.
//

import Foundation
//import Combine

class WeatherViewModel: ObservableObject {
    init() {
        self.weatherService = WeatherService()
    }
    
    private var weatherService: WeatherService!
    
    @Published var weather = Weather()
    @Published var weatherStats = WeatherStats()
    
    var cityName = ""
    
    var temperature: String {
        if let temp = self.weatherStats.temp {
            return "\(temp)"
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weatherStats.humidity {
            return "\(humidity)"
        } else {
            return ""
        }
    }
    
    private func fetchWeather(city: String, _ cb: @escaping () -> Void) {
        self.weatherService.getWeather(city: city) { weather in
            if let weatherResponse = weather {
                DispatchQueue.main.async {
                    self.weatherStats = weatherResponse.main
                    self.weather = weatherResponse.weather
                }
            }
            cb()
        }
    }
    
    func search(_ cb: @escaping () -> Void) {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            self.fetchWeather(city: city, cb)
        }
    }
}
