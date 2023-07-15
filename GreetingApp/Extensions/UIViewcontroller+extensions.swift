//
//  UIViewcontroller+extensions.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 03/07/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String = "", completion: (() -> ())? = nil) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
               completion?()
               alertController.dismiss(animated: true)
           }
           
           alertController.addAction(okAction)
           
           present(alertController, animated: true)
       }
}
