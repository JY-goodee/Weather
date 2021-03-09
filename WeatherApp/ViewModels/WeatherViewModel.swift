//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by 윤진영 on 2021/03/06.
//

import Foundation

private let defaultIcon = "❓"
private let iconMap = [
    "Drizzle": "🌨",
    "Thunderstorm" : "⛈",
    "Rain" : "🌧",
    "Snow" : "❄️",
    "Clear" : "☀️",
    "Clouds" : "☁️"
]

public class WeatherViewModel: ObservableObject{
    @Published var cityName: String
    @Published var temperature: [String]
    @Published var weatherDescription: [[String]]
    @Published var weatherIcon: [[String]]
    
    let weatherService: WeatherService
    
    init(weatherService: WeatherService){
        self.weatherService = weatherService
    }
    
    public func refresh(){
            weatherService.loadWeatherData{ weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                
                weather.
                
                self.temperature = "\(weather.temperture)C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
