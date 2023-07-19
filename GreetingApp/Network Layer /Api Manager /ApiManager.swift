//
//  ApiManager.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 03/07/23.
//

import Foundation

enum RequestType {
    case loginUser
}

extension RequestType {

    var baseUrl: String {
        return "https://reqres.in/api/"
    }
    
    var httpMethods: String {
        switch self {
        case .loginUser: return "POST"
        }
    }
    
    var httpHeaders: [String: String] {
        return ["Content-Type": "application/json", "Accept" : "application/json"]
    }
    
    var path: String {
        switch self {
        case .loginUser: return "login"
        }
    }
    
    var targetUrl: String {
        return baseUrl + path
    }
}
