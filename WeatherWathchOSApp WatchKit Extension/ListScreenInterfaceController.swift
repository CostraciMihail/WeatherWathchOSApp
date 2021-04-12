//
//  ListScreenInterfaceController.swift
//  WeatherWathchOSApp WatchKit Extension
//
//  Created by Mihail COSTRACI on 31.03.2021.
//

import WatchKit
import Foundation


class ListScreenInterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    // MARK: - View LyfeCycle
    //
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
//        loadRowItems()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // MARK: - Table
    //
    // Configure the table object and get the row controllers.
    func loadRowItems() {
        table.setNumberOfRows(10, withRowType: "TableRowID")
    }
    
}
