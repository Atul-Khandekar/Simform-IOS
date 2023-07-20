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
    
    func showEditAlert(title: String , message: String = "" , completion: ((UserUpdateRequestModel) -> ())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField { field in
            field.placeholder = "Enter New Name"
        }
        alertController.addTextField { field in
            field.placeholder = "Enter New Job"
        }
        
        alertController.addAction(UIAlertAction(title: "Discard", style: .default))
        alertController.addAction(UIAlertAction(title: "Update", style: .default , handler: { _ in
            
            guard let fields = alertController.textFields else {
                return
            }
            
            completion?(UserUpdateRequestModel(name: fields[0].text , job: fields[1].text))
            
        }))
        present(alertController,animated: true)
    }
    
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}
