//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Rob on 7/27/20.
//

import Foundation

typealias WeatherResponseCallback = (WeatherResponse?) -> Void

class WeatherService {
    
    private let baseURL = "http://api.openweathermap.org/data/2.5/weather"
    
    private var weatherApiKey: String? {
        get {
            if let path = Bundle.main.path(forResource: "keys", ofType: "plist"),
               let apiKey = NSDictionary(contentsOfFile: path)?["openWeatherKey"] as? String {
                return apiKey
            }
            return nil
        }
    }
    
    private 
    func getQueryURLFor(city: String) -> URL? {
        guard let apiKey = self.weatherApiKey else { return nil }
        
        let queryItems = [URLQueryItem(name: "q", value: city), URLQueryItem(name: "appid", value: apiKey)]
        if var urlComps = URLComponents(string: self.baseURL) {
            urlComps.queryItems = queryItems
            return urlComps.url
        } else {
            return nil
        }
    }
    
    func getWeather(city: String, completion: @escaping WeatherResponseCallback ) {
        guard let url = self.getQueryURLFor(city: city) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse {
                completion(weatherResponse)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
