//
//  Extensions.swift
//  WeatherWathchOSApp WatchKit Extension
//
//  Created by Mihail COSTRACI on 12.04.2021.
//

import Foundation
import WatchKit

protocol StoryboardInterfaceControllerID: class {
    static var id: String { get }
    associatedtype type: WKInterfaceController
}

extension StoryboardInterfaceControllerID {
    
    static var id: String {
        return "\(type.classForCoder())ID"
    }
}

