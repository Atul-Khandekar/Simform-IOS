//
//  UserUpdateRequestModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import Foundation

struct UserUpdateRequestModel: Codable, Convertible {
    let name: String?
    let job: String?
}
