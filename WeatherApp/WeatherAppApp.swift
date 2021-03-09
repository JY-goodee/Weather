//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by 윤진영 on 2021/03/06.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
