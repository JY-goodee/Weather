//
//  Weather.swift
//  WeatherApp
//
//  Created by 윤진영 on 2021/03/06.
//

import Foundation

public struct Weather: Decodable {
    var city: String
    var description: [[String]] = [[String]]()
    var iconName: [[String]] = [[String]]()
    var temperture: [String] = [String]()
    
    init(response: APIResponse){
//        city = response.city.name
//        description = response.list.first?.weather.first?.description ?? ""
//        iconName = response.list.first?.weather.first?.iconName ?? ""
//        temperture = "\(response.list.first?.main.temp)"
        for listIndex in 0..<response.list.count{
            for weatherIndex in 0..<response.list[listIndex].weather.count{
                description[listIndex][weatherIndex] = response.list[listIndex].weather[weatherIndex].description
                iconName[listIndex][weatherIndex] = response.list[listIndex].weather[weatherIndex].iconName
            }
            temperture[listIndex] = "\(String(response.list[listIndex].main.temp))"
        }
        city = response.city.name
    }
}

struct APIResponse: Decodable {
    let list: [APIList]
    let city: APICity
    
//    enum CodingKeys: String, CodingKey {
//        case list
//        case city
//    }
//
//    init(from decoder: Decoder) throws{
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.list = try container.decode([APIList].self, forKey: .list)
//        self.city = try container.decode(APICity.self, forKey: .city)
//    }
}

struct APIList:Decodable {
    let main: APIMain
    let weather: [APIWeather]
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case main, weather
        case dtTxt = "dt_txt"
    }
}

struct APIMain: Decodable{
    let temp: Double
}

struct APIWeather: Decodable{
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}

struct APICity: Decodable {
    let name: String
}
