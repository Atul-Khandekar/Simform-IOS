//
//  Convertible.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 03/07/23.
//

import Foundation

protocol Convertible: Codable {
    
     func convertToData() -> Data
}

extension Convertible {
    func convertToData() -> Data {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self){
            return encoded
        }
        return Data()
    }
    
    func convertToDictionary() -> [String: Any] {
        let encoder = JSONEncoder()
        return (try? JSONSerialization.jsonObject(with: encoder.encode(self))) as? [String: Any] ?? [:]
    }
}
