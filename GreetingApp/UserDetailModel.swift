//
//  UserDetailModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 05/07/23.
//

import Foundation

struct UserDetail : Codable {
    
    let data : SingleUserData?
    let support : Support?
    
    enum CodingKeys: String, CodingKey {
        case data
        case support
    }
}

struct Support : Codable {
    
    let text : String?
    let url : String?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case url = "url"
    }
}

struct SingleUserData : Codable {
    
    let avatar : String?
    let email : String?
    let firstName : String?
    let id : Int?
    let lastName : String?
    
    enum CodingKeys: String, CodingKey {
        case avatar = "avatar"
        case email = "email"
        case firstName = "first_name"
        case id = "id"
        case lastName = "last_name"
    }
}
