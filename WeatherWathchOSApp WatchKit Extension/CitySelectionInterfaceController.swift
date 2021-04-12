//
//  CitySelectionInterfaceController.swift
//  WeatherWathchOSApp WatchKit Extension
//
//  Created by Mihail COSTRACI on 12.04.2021.
//

import Foundation
import WatchKit

class CitySelectionInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    var availableCities = [WeatherModel]()
    var selectedCities = [WeatherModel]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        setTitle("Done")
        
        if let cities = context as? [WeatherModel] {
            availableCities = cities
            setUpRows(with: cities)
            populateRowsWithData()
        }
    }
    
    func setUpRows(with: [WeatherModel]) {
        table.setNumberOfRows(availableCities.count, withRowType: "CityRow")
        
    }
    
    override func willDisappear() {
        super.willDisappear()
        saveSelectedCities()
    }
    
    func populateRowsWithData() {
        
        DispatchQueue.main.async {  [weak self] in
            guard let self = self else { return }
            
            for index in 0..<self.availableCities.count {
                guard let controller = self.table.rowController(at: index) as? CityRowController else {
                    continue
                }
                controller.weather = self.availableCities[index]
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        guard let rowController = table.rowController(at: rowIndex) as? CityRowController else {
            return
        }
        rowController.markAsSelected(!rowController.isSelected)
        
        guard let weatherModel = rowController.weather else {
            return
        }
        
        addToSelectedCities(rowController, weatherModel)
    }
    
    private func addToSelectedCities(_ rowController: CityRowController, _ weatherModel: WeatherModel) {
        
        if rowController.isSelected,
           !selectedCities.contains(where: { weather -> Bool in
            return weather == weatherModel
           }){
            selectedCities.append(weatherModel)
            
        } else if selectedCities.contains(where: { weather -> Bool in
            return weather == weatherModel
        }) {
            selectedCities.removeAll { weather -> Bool in
                return weather == weatherModel
            }
        }
    }
    
    func saveSelectedCities() {
        
        NotificationCenter.default.post(name: .didSelectCities, object: selectedCities)
    }
    
}

extension CitySelectionInterfaceController: StoryboardInterfaceControllerID {
    typealias type = CitySelectionInterfaceController
}
