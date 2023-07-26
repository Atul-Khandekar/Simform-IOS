//
//  Fruits.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 12/05/23.
//

import Foundation

struct Fruits  {
    let name: String
    
    static func getData() -> [String] {
        let data = [
            "Apple",
            "Mango",
            "Banana",
            "PineApple",
            "Coconut",
            "Strawberry",
            "Grapes",
            "BlueBerry",
        ]
        
        return data
    }
}
