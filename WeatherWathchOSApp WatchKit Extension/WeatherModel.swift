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

protocol WeatherModel {
    
    var city: String { get set }
    var temperatureCelsius: String { get set }
    var weatherType: WeatherType { get set }
}

struct WeatherStub: WeatherModel {
    
    var city: String
    var temperatureCelsius: String
    var weatherType: WeatherType
    
    init() {
        self.city = "Chisinau"
        self.temperatureCelsius = "16º"
        self.weatherType = .sunny
    }
    
    static func randoms() -> [WeatherStub] {
        
        var weather1 = WeatherStub()
        weather1.city = "Chisinau"
        weather1.temperatureCelsius = "18º"
        weather1.weatherType = .cloudy
        
        var weather2 = WeatherStub()
        weather2.city = "Ialoveni"
        weather2.temperatureCelsius = "20º"
        weather2.weatherType = .partiallyCloudy
        
        var weather3 = WeatherStub()
        weather3.city = "Orhei"
        weather3.temperatureCelsius = "12º"
        weather3.weatherType = .drizzle
        
        return [weather1, weather2, weather3]
    }
    
}
