//
//  MainInterfaceController.swift
//  WeatherWathchOSApp WatchKit Extension
//
//  Created by Mihail COSTRACI on 31.03.2021.
//

import WatchKit
import Foundation
import Combine

class MainInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var weatherIcon: WKInterfaceImage!
    @IBOutlet weak var temperatureLabel: WKInterfaceLabel!
    @IBOutlet weak var locationLabel: WKInterfaceLabel!
    
    var weatherModel: WeatherModel!
    
    var cancelBag = Set<AnyCancellable>()
    
    override func awake(withContext context: Any?) {
        weatherModel = WeatherModel.randoms()[Int.random(in: 0..<3)]
        updateData()
        setUpCitiesSelectionBindings()
    }
    
    override func didAppear() {
        super.didAppear()
        
    }
    
    override func willDisappear() {
        super.willDisappear()
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
    
    @IBAction func selectCityToDisplay(_ sender: Any) {
        
        presentController(withName: CitySelectionInterfaceController.id, context: WeatherModel.randoms())
    }
    
    @IBAction func didSwipe(_ sender: Any) {
        
        pushController(withName: "Screen2-ID", context: nil)
    }

    func setUpCitiesSelectionBindings() {
        
        NotificationCenter
            .default
            .publisher(for: .didSelectCities).sink { [weak self] notification in
                
                guard let self = self,
                      let selectedCities = notification.object as? [WeatherModel],
                      let firstCity = selectedCities.first else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.weatherModel = firstCity
                    self.updateData()
                }
                
            }.store(in: &cancelBag)
    }
    
    func clearAllBindings() {
        cancelBag.removeAll()
    }
}

extension NSNotification.Name {
    public static let didSelectCities = Notification.Name(rawValue: "didSelectCities")
}
