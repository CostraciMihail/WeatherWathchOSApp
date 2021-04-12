//
//  WeatherModel.swift
//  WeatherWathchOSApp WatchKit Extension
//
//  Created by Mihail COSTRACI on 01.04.2021.
//

import Foundation

enum WeatherType {
    case sunny
    case partiallyCloudy
    case cloudy
    case overcast
    case rain
    case drizzle
    case snow
    case stormy
}

protocol WeatherModelProtocol: Equatable {
    var city: String { get set }
    var temperatureCelsius: String { get set }
    var weatherType: WeatherType { get set }
}

struct WeatherModel: WeatherModelProtocol, Equatable {
    var city: String
    var temperatureCelsius: String
    var weatherType: WeatherType
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.city == rhs.city &&
            lhs.temperatureCelsius == rhs.temperatureCelsius &&
            lhs.weatherType == rhs.weatherType
    }
}

extension WeatherModel {
    
    static func randoms() -> [WeatherModel] {
        
        let weather1 = WeatherModel(city: "Chisinau",
                                    temperatureCelsius: "18º",
                                    weatherType: .cloudy)
        
        let weather2 = WeatherModel(city: "Ialoveni",
                                    temperatureCelsius: "20º",
                                    weatherType: .partiallyCloudy)
        
        let weather3 = WeatherModel(city: "Orhei",
                                    temperatureCelsius: "12º",
                                    weatherType: .drizzle)
        
        let weather4 = WeatherModel(city: "Balti",
                                    temperatureCelsius: "11º", weatherType: .overcast)
        
        
        let weather5 = WeatherModel(city: "Comrat",
                                    temperatureCelsius:  "18º",
                                    weatherType: .snow)
        
        
        let weather6 = WeatherModel(city: "Dubasari",
                                    temperatureCelsius: "19º",
                                    weatherType: .cloudy)
        
        let weather7 = WeatherModel(city: "Hincesti",
                                    temperatureCelsius: "26º",
                                    weatherType: .sunny)
        
        return [weather1, weather2, weather3, weather4, weather5, weather6, weather7]
    }
}
