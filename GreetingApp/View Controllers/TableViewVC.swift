//
//  TableViewVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 02/06/23.
//

import UIKit

class TableViewVC: UIViewController {
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: - Actions
extension TableViewVC {
    
    @IBAction private func onClickToUserNames(_ sender: UIButton) {
        coordinator?.goToUserTableVC()
    }
    
    @IBAction private func onClickToExpandableSections(_ sender: UIButton) {
        coordinator?.goToExpandableSectionVC()
    }
    
    @IBAction private func onClickToCustomTable(_ sender: UIButton) {
        coordinator?.goToCustomTableVC()
    }
    
}
