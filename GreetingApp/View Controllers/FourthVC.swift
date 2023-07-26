//
//  FourthVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 31/05/23.
//

import UIKit

class FourthVC: UIViewController {
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Actions
extension FourthVC {
    @IBAction private func onClickBackToHomeScreen(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
