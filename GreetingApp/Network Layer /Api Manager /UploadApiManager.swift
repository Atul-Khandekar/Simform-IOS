//
//  UploadApiManager.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import Foundation

enum UploadRequestType {
    case uploadImage
}

extension UploadRequestType {

    var baseUrl: String {
        return "https://api.upload.io/v2/accounts/kW15bXr/"
    }
    
    var httpMethods: String {
        switch self {
        case .uploadImage: return "POST"
        }
    }
    
    var httpHeaders: [String: String] {
        return ["Authorization": "Bearer public_kW15bXrgMq2hTVV8AoEiU2mK9cAY", "Content-Type": "image/png"]
    }
    
    var path: String {
        switch self {
        case .uploadImage : return "uploads/binary"
        }
    }
    
    var targetUrl: String {
        return baseUrl + path
    }
}
