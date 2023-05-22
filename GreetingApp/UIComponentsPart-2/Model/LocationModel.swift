//
//  Locations.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 23/05/23.
//

import Foundation
import CoreLocation

struct LocationModel {
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    static func getLocations() -> [LocationModel] {
        let data = [
            LocationModel(name: "Simform Solutions", coordinate: CLLocationCoordinate2D(latitude: 23.0281, longitude: 72.4994)), 
            LocationModel(name: "L D College Of Engineering", coordinate: CLLocationCoordinate2D(latitude: 23.0338, longitude: 72.5466)) ,
            LocationModel(name: "River Front", coordinate: CLLocationCoordinate2D(latitude: 23.0235, longitude: 72.5766)) ,
            LocationModel(name: "Kalupur Railway station ", coordinate: CLLocationCoordinate2D(latitude: 23.0283, longitude: 72.5937)) ,
            LocationModel(name: "Eiffel Tower", coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945)) ,
            LocationModel(name: "Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.6762, longitude: 139.6503)) ,
            LocationModel(name: "Berlin", coordinate: CLLocationCoordinate2D(latitude: 52.490193, longitude: 13.474948))
        ]
        return data
    }
}
