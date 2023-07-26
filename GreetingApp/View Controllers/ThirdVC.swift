//
//  ThirdVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 30/05/23.
//

import UIKit

class ThirdVC: UIViewController {
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    private var lblTitleForThirdVC: UILabel = {
        let label = UILabel()
        label.text = AppConstants.thirdViewController
        label.textColor = UIColor.white
        label.font = label.font.withSize(30)
        return label
    }()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension ThirdVC {
    
    @IBAction private func onClickToHomeScreen(_ sender: Any) {
        coordinator?.backToHome()
    }
    
    @IBAction private func backToNavigationController(_ sender: Any) {
        coordinator?.backToNavigationController()
    }
}

//MARK: - setupView
extension ThirdVC {
    private func setupView() {
        navigationItem.titleView = lblTitleForThirdVC
    }
}
