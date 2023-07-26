//
//  SecondVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 30/05/23.
//

import UIKit

class SecondVC: UIViewController {
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    private var lblTitleForSecondVC: UILabel = {
        let label = UILabel()
        label.text = AppConstants.secondViewController
        label.textColor = UIColor.red
        label.font = label.font.withSize(25.0)
        return label
    }()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension SecondVC {
    @IBAction private func onClickToThirdVC(_ sender: UIButton) {
        coordinator?.goToThirdVC()
    }
}

//MARK: - setupView
extension SecondVC {
    private func setupView() {
        navigationItem.titleView = lblTitleForSecondVC
    }
}
