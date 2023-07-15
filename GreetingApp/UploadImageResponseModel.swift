//
//  UploadImageResponseModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import Foundation

struct UploadImageResponseModel : Codable {

    let accountId : String?
    let filePath : String?
    let fileUrl : String?

    enum CodingKeys: String, CodingKey {
        case accountId = "accountId"
        case filePath = "filePath"
        case fileUrl = "fileUrl"
    }

}
