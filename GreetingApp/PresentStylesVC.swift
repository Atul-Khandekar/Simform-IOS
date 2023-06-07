//
//  PresentStylesVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 31/05/23.
//

import UIKit

class PresentStylesVC: UIViewController {

    //MARK: - variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - View LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Actions
extension PresentStylesVC {
    @IBAction func onClickFullScreen(_ sender: Any) {
        coordinator?.goToFourthWithFullScreen()
    }
    
    @IBAction func onClickCurrentContext(_ sender: Any) {
        coordinator?.goToFourthWithCurrentContext()
    }
    
    @IBAction func onClickOverFullScreen(_ sender: Any) {
        coordinator?.goToFourthWithOverFullScreen()
    }
    @IBAction func onClickPageSheet(_ sender: Any) {
        coordinator?.goToFourthWithPageSheet()
    }
    
    @IBAction func onClickFormSheet(_ sender: Any) {
        coordinator?.goToFourthWithFormSheet()
    }
}
