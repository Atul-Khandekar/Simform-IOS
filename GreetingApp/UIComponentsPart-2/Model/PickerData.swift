//
//  ColorPickerData.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 22/05/23.
//

import Foundation

struct Color {
    let name: String
    
    static func getColors() -> [String] {
        let data = [
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Pink",
        "Orange"
        ]
        return data
    }
}
