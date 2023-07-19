//
//  RailwayApiManager.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import Foundation

enum RailwayRequestType {
    case railwayTimeTable(Int)
}

extension RailwayRequestType {

    var baseUrl: String {
        return "https://api.data.gov.in/resource/13051d52-05c2-4130-9e7b-891bdde84076?api-key=579b464db66ec23bdd0000012035fcce923e43627973942a9637f7d8&format=json&"
    }
    
    var httpMethods: String {
        switch self {
        case .railwayTimeTable(_): return "GET"
        }
    }
    
    var httpHeaders: [String: String] {
        return ["Content-Type": "application/json", "Accept" : "application/json"]
    }
    
    var path: String {
        switch self {
        case .railwayTimeTable(let offset): return "offset=\(offset)&limit=5"
        }
    }
    
    var targetUrl: String {
        return baseUrl + path
    }
}
