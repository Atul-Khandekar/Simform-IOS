//
//  UIImages+extensions.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 04/07/23.
//

import Foundation
import UIKit
let imageCache = NSCache<AnyObject, UIImage>()

extension UIImageView {
    
    
    func load(url: URL) {
        
        if let cachedImage = imageCache.object(forKey: url as AnyObject) {
            debugPrint("image cached \(url)")
            DispatchQueue.global().async { [weak self] in
                DispatchQueue.main.async {
                    self?.image = cachedImage
                }
            }
        } else {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                            imageCache.setObject(self?.image ?? UIImage(), forKey: url as AnyObject)
                        }
                    }
                   
                }
            }
            debugPrint("image downloaded from server")
        }
    }
}
