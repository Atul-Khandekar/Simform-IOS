//
//  ColorPickerData.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 22/05/23.
//

import Foundation
import UIKit

struct Color {
    let name: String
    let colorName: UIColor
    
    static func getColors() -> [Color] {
        let data  = [
            Color(name: "Red", colorName: UIColor.red),
            Color(name: "Blue", colorName: UIColor.blue),
            Color(name: "Green", colorName: UIColor.green),
            Color(name: "Yellow", colorName: UIColor.yellow),
            Color(name: "Pink", colorName: UIColor.systemPink),
            Color(name: "Gray", colorName: UIColor.gray),
            Color(name: "Cyan", colorName: UIColor.cyan),
            Color(name: "Orange", colorName: UIColor.orange),
        ]
        return data
    }
}
