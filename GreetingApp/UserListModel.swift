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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([UserListData].self, forKey: .data)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        perPage = try values.decodeIfPresent(Int.self, forKey: .perPage)
        support = try UserListSupport(from: decoder)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
    }
    
}

struct UserListSupport : Codable {

    let text : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case text = "text"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        url = try values.decodeIfPresent(String.self, forKey: .url)
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
    }
}
