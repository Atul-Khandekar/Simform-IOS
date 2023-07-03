//
//  StackVCViewModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 03/07/23.
//

import Foundation

class StackViewModel: BaseViewModel {
    
    let errorMessage = Dynamic<String>("")
    let loginSuccess = Dynamic<String>("")
    
    func authenticate(email: String? , password: String?) {
        
        guard let email = email , let password = password else  {return}
        
        if email.isEmpty || password.isEmpty {
            self.errorMessage.value = "Email or Password can't be empty"
        } else {
            callApi(email: email , password: password)
        }
        
    }
    
    func callApi(email: String , password: String) {
        let userDetails = StackModel(email: email, password: password)
        callLoginApi(requestPayload: userDetails.convertToData(), requestType: .loginUser) { [weak self] (result: Result<StackResponseModel, Error>) -> ()  in
            switch result {
            case .success(let response):
                guard let token = response.token else {
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.errorMessage.value = "Please Enter valid login and password"
                    }
                    return
                    
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.loginSuccess.value = token
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage.value = error.localizedDescription
                }
            }
        }
    }
}
