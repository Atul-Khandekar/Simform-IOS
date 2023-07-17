//
//  CloseAccountVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/06/23.
//

import UIKit

class CloseAccountVC: UIViewController {

    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Extension
extension CloseAccountVC {
    
    @IBAction private func onClickDismissCloseAccountVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

