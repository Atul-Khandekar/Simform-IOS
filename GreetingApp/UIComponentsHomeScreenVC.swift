//
//  UIComponentsHomeScreenVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 30/05/23.
//

import UIKit

class UIComponentsHomeScreenVC: UIViewController {

    //MARK: - Variables
    var coordinator: MainCoordinator?

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Actions
extension UIComponentsHomeScreenVC {
    @IBAction func onClickToNavigationController(_ sender: UIButton) {
        if let navigationController {
            coordinator = MainCoordinator(navigationController: navigationController)
            coordinator?.start()
        }
    }
}
