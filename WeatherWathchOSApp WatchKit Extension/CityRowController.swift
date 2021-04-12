//
//  CityRowController.swift
//  WeatherWathchOSApp WatchKit Extension
//
//  Created by Mihail COSTRACI on 12.04.2021.
//

import WatchKit

class CityRowController: NSObject {

    @IBOutlet weak var textGroup: WKInterfaceGroup!
    @IBOutlet var titleLabel: WKInterfaceLabel!
    var isSelected = false
    
    var weather: WeatherModel? {
        didSet { configureUI() }
    }
    
    func configureUI() {
        
        guard let weather = weather else { return }
        titleLabel.setText(weather.city)
        textGroup.setBackgroundColor(UIColor.black.withAlphaComponent(0.5))
        titleLabel.setTextColor(.white)
    }
    
    func markAsSelected(_ isSelected: Bool) {
        
        self.isSelected = isSelected
        
        if self.isSelected {
            textGroup.setBackgroundColor(.lightGray)
            titleLabel.setTextColor(.white)
            
        } else {
            textGroup.setBackgroundColor(UIColor.black.withAlphaComponent(0.5))
            titleLabel.setTextColor(.white)
        }
    }

}
