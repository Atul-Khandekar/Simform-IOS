//
//  UserListViewModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 04/07/23.
//

import Foundation
import Alamofire

class UserListViewModel {
    
    func getUserList(page: Int , listHandler: @escaping (UserListModel?) -> Void) {
        
        AF.request(RequestType.listUser(page).targetUrl).responseData { responseData in
            
            switch responseData.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseUserList = try decoder.decode(UserListModel.self, from: data)
                    DispatchQueue.main.async {
                        listHandler(responseUserList)
                    }
                    
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
                
            }
            
        }
    }
    
    func getSingleUserDetail(id: Int, singleUserHandler: @escaping ((UserDetail) -> ())) {
        AF.request(RequestType.singleUser(id).targetUrl).responseData { responseData in
            
            switch responseData.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseSingleUser = try decoder.decode(UserDetail.self, from: data)
                    DispatchQueue.main.async {
                      singleUserHandler(responseSingleUser)
                    }
                    
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
