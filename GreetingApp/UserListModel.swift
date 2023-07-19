//
//  UserListModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 04/07/23.
//

import Foundation

struct UserListModel : Codable {

    let data : [UserListData]?
    let page : Int?
    let perPage : Int?
    let support : UserListSupport?
    let total : Int?
    let totalPages : Int?
    
    enum CodingKeys: String, CodingKey {
            case data = "data"
            case page = "page"
            case perPage = "per_page"
            case support
            case total = "total"
            case totalPages = "total_pages"
        }

}

struct UserListSupport : Codable {

    let text : String?
    let url : String?
    
    enum CodingKeys: String, CodingKey {
            case text = "text"
            case url = "url"
        }

}

struct UserListData : Codable {
    
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
