//
//  SecondVc.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 29/05/23.
//

import UIKit

class ReceiverVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var lblName: UILabel!
    
    //MARK: - Variables
    var text: String = ""
    weak var delegate: SenderVCDelegate?
    weak var coordinator: MainCoordinator?

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension ReceiverVC {
    @IBAction func onClickBackwardDataPass(_ sender: UIButton) {
        delegate?.setTitle(textFieldTitle.text)
        coordinator?.goBackToViewController()
    }
}

//MARK: - setupView
extension ReceiverVC {
    private func setupView() {
        lblName.text = text
        textFieldTitle.delegate = self
    }
}

//MARK: - UITextFieldDelegate
extension ReceiverVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
