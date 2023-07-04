//
//	UserListData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

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