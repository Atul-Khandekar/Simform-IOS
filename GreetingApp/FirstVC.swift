//
//  FirstVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 30/05/23.
//

import UIKit

class FirstVC: UIViewController {
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    var lblTitle: UILabel = {
        let label = UILabel()
        label.text = AppConstants.firstViewController
        label.textColor = UIColor.blue
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension FirstVC {
    @IBAction func onClickToSecondVC(_ sender: UIButton) {
        coordinator?.goToSecondVC()
    }
}

//MARK: - setupView
extension FirstVC {
    private func setupView() {
        navigationItem.titleView = lblTitle
    }
}
