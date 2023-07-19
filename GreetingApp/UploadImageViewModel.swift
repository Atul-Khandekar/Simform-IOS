//
//  UploadImageViewModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import Foundation
import Alamofire
import UIKit

class UploadImageViewModel {
    
    var imageUrl = Dynamic<String>("")
    
    func uploadImage(image: UIImage) {
        
        guard let imageData = image.pngData() else {
            return
        }
        AF.upload(imageData, to: UploadRequestType.uploadImage.targetUrl , headers: HTTPHeaders(UploadRequestType.uploadImage.httpHeaders)).responseData { responseData in
            
            switch responseData.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseImageData = try decoder.decode(UploadImageResponseModel.self, from: data)
                    DispatchQueue.main.async {
                        self.imageUrl.value = responseImageData.fileUrl
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
