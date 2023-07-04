//
//  ApiManager.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 03/07/23.
//

import Foundation

enum RequestType {
    case loginUser
    case listUser(Int)
}

extension RequestType {

    var baseUrl: String {
        return "https://reqres.in/api/"
    }
    
    var httpMethods: String {
        switch self {
        case .loginUser: return "POST"
        case .listUser(_): return "GET"
        }
    }
    
    var httpHeaders: [String: String] {
        return ["Content-Type": "application/json", "Accept" : "application/json"]
    }
    
    var path: String {
        switch self {
        case .loginUser: return "login"
        case .listUser(let page): return "users?page=\(page)"
        }
    }
    
    var targetUrl: String {
        return baseUrl + path
    }
}
