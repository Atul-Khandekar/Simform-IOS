//
//  HomeVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 29/05/23.
//

import UIKit

protocol SenderVCDelegate: AnyObject {
    func setTitle(_ title: String?)
}

class SenderVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var textFieldName: UITextField!

    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension SenderVC {
    @IBAction func onClickForwardDataPass(_ sender: UIButton) {
        if let txtName = textFieldName.text {
            coordinator?.goToReceiverVC(text: txtName, viewController: self)
        }
    }
}

//MARK: - SenderVCDelegate
extension SenderVC: SenderVCDelegate {
    func setTitle(_ title: String?) {
        if let title = title {
            lblTitle.text  = title
        }
    }
}

//MARK: - UITextFieldDelegate
extension SenderVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - setupView
extension SenderVC {
    private func setupView() {
        textFieldName.delegate = self
    }
}
