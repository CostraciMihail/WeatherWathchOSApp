//
//  InterfaceController.swift
//  WeatherWathchOSApp WatchKit Extension
//
//  Created by Mihail COSTRACI on 31.03.2021.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var weatherIcon: WKInterfaceImage!
    @IBOutlet weak var temperatureLabel: WKInterfaceLabel!
    @IBOutlet weak var locationLabel: WKInterfaceLabel!
    
    var weatherModel: WeatherModel {
        return WeatherStub.randoms()[Int.random(in: 0..<3)]
    }
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        
        updateData()
    }
    
    func updateData() {
        
        setUpWeatherIcon()
        setUpTemperature()
        setUpLocation()
    }
    
    func setUpWeatherIcon() {
        
        switch weatherModel.weatherType {
        case .sunny: weatherIcon.setImage(UIImage(systemName: "sun.max"))
        case .partiallyCloudy: weatherIcon.setImage(UIImage(systemName: "cloud.sun"))
        case .cloudy: weatherIcon.setImage(UIImage(systemName: "cloud"))
        case .rain: weatherIcon.setImage(UIImage(systemName: "cloud.rain"))
        case .drizzle: weatherIcon.setImage(UIImage(systemName: "cloud.drizzle"))
        case .snow: weatherIcon.setImage(UIImage(systemName: "snow"))
        case .stormy: weatherIcon.setImage(UIImage(systemName: "tropicalstorm"))
        default: weatherIcon.setImage(UIImage(systemName: "cloud"))
        }
    }
    
    func setUpTemperature() {
        temperatureLabel.setText(weatherModel.temperatureCelsius)
    }
    
    func setUpLocation() {
        locationLabel.setText(weatherModel.city)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    @IBAction func didTouchIcon(_ sender: Any) {
        updateData()
    }
    
}
