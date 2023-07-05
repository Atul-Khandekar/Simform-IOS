//
//  UserDetailViewModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 05/07/23.
//

import Foundation
import Alamofire

class UserDetailViewModel {
    
    var updatedDetail: Dynamic<UserUpdateDetailModel> = Dynamic.init(nil)
    
    func updateDetails(name: String , job: String) {
        
        let param = ["name": name , "job": job]
        
        AF.request(RequestType.updateUser.targetUrl , method: .patch , parameters: param).responseData { responseData in
            
            switch responseData.result {
                
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(UserUpdateDetailModel.self.self, from: data)
                    self.updatedDetail.value = responseData
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
