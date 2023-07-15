//
//  UserDetailUpdateModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 05/07/23.
//

import Foundation

struct UserUpdateDetailModel : Codable {
    
    let job : String?
    let name : String?
    let updatedAt : String?
    
    enum CodingKeys: String, CodingKey {
        case job = "job"
        case name = "name"
        case updatedAt = "updatedAt"
    }
}

