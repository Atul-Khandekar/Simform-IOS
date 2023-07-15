//
//  LoginScreenVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 15/07/23.
//

import UIKit

class LoginScreenVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    private var viewModel = LoginViewModel()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindErrorMessage()
        bindLoginStatus()
    }
   
}

//MARK: - Actions
extension LoginScreenVC {
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
    
    @IBAction func onClickToLogin(_ sender: UIButton) {
        authenticateUser()
    }
}

//MARK: - View Methods
extension LoginScreenVC {
    private func alert(_ message: String) {
        let alert = UIAlertController(title: AppConstants.alertTitleForToolBar, message: message, preferredStyle: .alert)
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dismiss(animated: true)
        }
    }
}

//MARK: - UITextFieldDelegate
extension LoginScreenVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - setupView
extension LoginScreenVC {
    private func setupView() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

//MARK: - authenticate
extension LoginScreenVC {
    private func authenticateUser() {
        viewModel.authenticate(email: emailTextField.text, password: passwordTextField.text)
    }
    
    private func bindErrorMessage() {
        viewModel.errorMessage.bind { [weak self] message in
            guard let message else {
                return
            }
            self?.showAlert(title: "Login failed", message: message)
        }
    }
    
    private func bindLoginStatus() {
        viewModel.loginSuccess.bind { [weak self] token in
            self?.showAlert(title: "Login successful", message: "Token: \(String(describing: token))")
        }
    }
}
