//
//  ChangeEmailVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 05/06/23.
//

import UIKit

class ChangeEmailVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var btnDismissChangeEmailVC: UIButton!
    @IBOutlet weak private var textFieldNewEmail: UITextField!
    @IBOutlet weak private var textFieldOTP: UITextField!
    @IBOutlet weak private var btnSave: UIButton!
    @IBOutlet weak var viewMain: UIView!
   
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - setupView
extension ChangeEmailVC {
    private func setupView() {
        textFieldNewEmail.delegate = self
        textFieldOTP.delegate = self
        
        btnDismissChangeEmailVC.setImage(UIImage(systemName: UIImage.dismissIcon), for: .normal)
        btnDismissChangeEmailVC.layer.cornerRadius = btnDismissChangeEmailVC.frame.size.width * 0.5
        btnDismissChangeEmailVC.clipsToBounds = true
        btnDismissChangeEmailVC.tintColor = UIColor(named: CustomColor.btnDismissColor)
        btnSave.layer.cornerRadius = AppConstants.profileScreenViewCornerRadius
        viewMain.layer.cornerRadius = AppConstants.changeEmailCornerRadius
        viewMain.clipsToBounds = true
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
}

//MARK: - UITextFieldDelegate
extension ChangeEmailVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - Actions
extension ChangeEmailVC {
    @IBAction private func onClickDismissChangeEmailVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
