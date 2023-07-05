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
    case singleUser(Int)
    case updateUser
}

extension RequestType {

    var baseUrl: String {
        return "https://reqres.in/api/"
    }
    
    var httpMethods: String {
        switch self {
        case .loginUser: return "POST"
        case .listUser(_): return "GET"
        case .singleUser(_): return "GET"
        case.updateUser: return "PATCH"
        }
    }
    
    var httpHeaders: [String: String] {
        return ["Content-Type": "application/json", "Accept" : "application/json"]
    }
    
    var path: String {
        switch self {
        case .loginUser: return "login"
        case .listUser(let page): return "users?page=\(page)"
        case.singleUser(let id): return "users/\(id)"
        case.updateUser: return "users/2"
        }
    }
    
    var targetUrl: String {
        return baseUrl + path
    }
}
