//
//  SecondInterfaceController.swift
//  WeatherWathchOSApp WatchKit Extension
//
//  Created by Mihail COSTRACI on 01.04.2021.
//

import WatchKit
import Foundation

class SecondInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var firstGroup: WKInterfaceGroup!
    @IBOutlet weak var secondGroup: WKInterfaceGroup!
    @IBOutlet weak var thirdGroup: WKInterfaceGroup!
    
    @IBOutlet weak var rightSwipeGesture: WKSwipeGestureRecognizer!
    @IBOutlet weak var leftSwipeGesture: WKSwipeGestureRecognizer!
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func didSwipeToRight(_ sender: Any) {
        
        animate(withDuration: 0.3) {  [weak self] in
            guard let self = self else { return }
            self.firstGroup.setWidth(0)
            self.secondGroup.setWidth(30)
        }
    }
    
    @IBAction func didSwipeToLeft(_ sender: Any) {
        
    }
    
    @IBOutlet weak var tapGesture: WKTapGestureRecognizer!
    
    @IBAction func didTapAction(_ sender: Any) {
        
        animate(withDuration: 0.2) {  [weak self] in
        
            guard let self = self else { return }
            self.firstGroup.setWidth(0)
            
        }
        
    }
    
}
