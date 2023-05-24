//
//  StackViewVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 17/05/23.
//

import UIKit

class StackViewVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension StackViewVC {
    @IBAction private func onClickEdit(_ btnEdit: UIBarButtonItem) {
        emailTextField.isUserInteractionEnabled = true
        passwordTextField.isUserInteractionEnabled = true
        alert(AppConstants.enableEditingToolBar)
    }
    
    @IBAction private func onClickCancel(_ btnCancel: UIBarButtonItem) {
        emailTextField.isUserInteractionEnabled = false
        passwordTextField.isUserInteractionEnabled = false
        alert(AppConstants.disableEditingToolBar)
    }
}

//MARK: - View Methods
extension StackViewVC {
    private func alert(_ message: String) {
        let alert = UIAlertController(title: AppConstants.alertTitleForToolBar, message: message, preferredStyle: .alert)
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dismiss(animated: true)
        }
    }
}

//MARK: - UITextFieldDelegate
extension StackViewVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - setupView
extension StackViewVC {
    private func setupView() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}
