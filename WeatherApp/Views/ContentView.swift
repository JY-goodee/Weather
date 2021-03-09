//
//  ContentView.swift
//  WeatherApp
//
//  Created by 윤진영 on 2021/03/06.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 10){
            Text(model.cityName)
                .font(.largeTitle)
            Text(model.temperature)
            Text(model.weatherIcon)
            Text(model.weatherDescription)
            
        }.onAppear(perform: model.refresh)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: WeatherViewModel(weatherService: WeatherService()))
    }
}
