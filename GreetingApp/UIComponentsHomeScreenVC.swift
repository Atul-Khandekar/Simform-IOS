//
//  UIComponentsHomeScreenVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 30/05/23.
//

import UIKit

class UIComponentsHomeScreenVC: UIViewController {
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.systemBlue
    }
    
}

//MARK: - Actions
extension UIComponentsHomeScreenVC {
    @IBAction private func onClickToNavigationController(_ sender: UIButton) {
        coordinator?.goToNavigationControllVC()
    }
    
    @IBAction private func onClickToOnboardingScreenVC(_ sender: UIButton) {
        coordinator?.goToOnboardingScreenVc()
    }
    
    @IBAction private func onClickToTextFieldVC(_ sender: UIButton) {
        coordinator?.goToTextFieldVC()
    }
    
    @IBAction private func onClickToLabel(_ sender: UIButton) {
        coordinator?.goToLabelVC()
    }
    
    @IBAction private func onClickToSwitchVC(_ sender: UIButton) {
        coordinator?.goToSwitchVC()
    }
    
    @IBAction private func onClickToSliderVC(_ sender: UIButton) {
        coordinator?.goToSliderVC()
    }
    
    @IBAction private func onClickToSegmentControlVC(_ sender: UIButton) {
        coordinator?.goToSegmentControlVc()
    }
    
    @IBAction private func onClickToProgressViewVC(_ sender: UIButton) {
        coordinator?.goToProgressViewVC()
    }
    
    @IBAction private func onClickToStepperVC(_ sender: UIButton) {
        coordinator?.goToStepperVC()
    }
    
    @IBAction private func onClickToTextViewVC(_ sender: UIButton) {
        coordinator?.goToTextViewVC()
    }
    
    @IBAction private func onClickToScrollView(_ sender: UIButton) {
        coordinator?.goToScrollViewVC()
    }
    
    @IBAction private func onClickToButtonVC(_ sender: UIButton) {
        coordinator?.goToButtonVC()
    }
    
    @IBAction private func onClickToTableView(_ sender: UIButton) {
        coordinator?.goToTableViewVC()
    }
    
    @IBAction private func onClickToCollectionViewVC(_ sender: UIButton) {
        coordinator?.goToCollectionViewVC()
    }
    
    @IBAction private func onClickToSearchBarVC(_ sender: UIButton) {
        coordinator?.goToSearchBarVc()
    }
    
    @IBAction private func onClickToStackViewAndToolBarVC(_ sender: UIButton) {
        coordinator?.goToStackViewAndToolBarVC()
    }
    
    @IBAction private func onClickToTabBar(_ sender: UIButton) {
        coordinator?.goToTabBarVC()
    }
    
    @IBAction private func onClickToImagePickerVC(_ sender: UIButton) {
        coordinator?.goToImagePickerVC()
    }
    
    @IBAction private func onClickToPickerVC(_ sender: UIButton) {
        coordinator?.goToPickerView()
    }
    
    @IBAction private func onClickToMapViewVC(_ sender: UIButton) {
        coordinator?.goToMapViewVC()
    }
    
    @IBAction private func onClickToWebViewVC(_ sender: UIButton) {
        coordinator?.goToWebViewVC()
    }
    
    @IBAction private func onClickToParkingLotScreen(_ sender: UIButton) {
        coordinator?.goToParkingLotVC()
    }
    
    @IBAction func onClickToProfileScreen(_ sender: UIButton) {
        coordinator?.goToProfileScreen()
    }
    
    @IBAction func onClickToUserListVC(_ sender: UIButton) {
        coordinator?.goToUserListVC()
    }
}
