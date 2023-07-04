//
//  BaseViewModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 03/07/23.
//

import Foundation

class BaseViewModel: NSObject {
    
    //MARK: - Functions
    /// Use to execute the API request using URLSession and gives call back using completion handler
    /// - Parameters:
    ///   - requestPayload: payload to pass while making a POST call
    ///   - requestType: type of httpRequest to make
    ///   - completionHandler: generic completion handler which gives callback after api call finished and response arrieved
    func callLoginApi(requestPayload: Data?, requestType: RequestType, completionHandler: @escaping (Result<StackResponseModel, Error>) -> ()) {
        guard let targetUrl = URL(string: requestType.targetUrl) else { return }
        var urlRequest = URLRequest(url: targetUrl)
        urlRequest.allHTTPHeaderFields = requestType.httpHeaders
        urlRequest.httpMethod = requestType.httpMethods
        if requestPayload != nil {
            urlRequest.httpBody = requestPayload
        }
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let error = error {
                print("Error in DataTask: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let userResponse = try decoder.decode(StackResponseModel.self, from: data)
                completionHandler(.success(userResponse))
            } catch {
                completionHandler(.failure(error))
            }
        }
        dataTask.resume()
    }
}

