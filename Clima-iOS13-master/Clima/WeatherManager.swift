//
//  WeatherManager.swift
//  Clima
//
//  Created by HaBV on 28/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weratherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8b7a33eb08336bdd18d853cda735258e&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weratherURL)&q=\( cityName)"
        performRequest(urlString: urlString)
        
    }
    
    func fetchWeatherByCoordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weratherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let dataDecoded = try decoder.decode(WeatherData.self, from: weatherData)
            let id = dataDecoded.weather[0].id
            let cityName = dataDecoded.name
            let temp = dataDecoded.main.temp
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temp)
            
            return weather
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
