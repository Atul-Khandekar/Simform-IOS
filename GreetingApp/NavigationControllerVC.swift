//
//  NavigationControllerVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 30/05/23.
//

import UIKit

class NavigationControllerVC: UIViewController {
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    lazy var navBar = navigationController?.navigationBar
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension NavigationControllerVC {
    
    @IBAction private func onClickToSenderVC(_ sender: UIButton) {
        coordinator?.goToSenderVC()
    }
    @IBAction private func onClickToFirstVC(_ sender: UIButton) {
        coordinator?.goToFirstVC()
    }
    @IBAction private func onClickToPresentStylesVC(_ sender: UIButton) {
        coordinator?.goToPresentVC()
    }
}
//MARK: - setupView
extension NavigationControllerVC {
    private func setupView() {
        if let _ = navigationController?.viewControllers.contains(self) {
            navBar?.tintColor = UIColor.brown
        }
        
        let moreButton =  UIBarButtonItem(title: AppConstants.barButtonTitle, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = moreButton
        navigationItem.title = AppConstants.navigationScreenTitle
        
        let menuActionHandler: UIActionHandler = { action in
            print(action.title)
        }
        
        let barButtonMenu = UIMenu(children: [
            UIAction(title: AppConstants.menuProfile ,image: UIImage(systemName: UIImage.menuProfileIcon) , handler: menuActionHandler),
            UIAction(title: AppConstants.menuBrightness , image: UIImage(systemName: UIImage.menuBrightnessIcon) , handler: menuActionHandler),
            UIAction(title: AppConstants.menuDocuments ,image: UIImage(systemName: UIImage.menuDocumentsIcon), handler: menuActionHandler),
            UIAction(title: AppConstants.menuBookMarks , image: UIImage(systemName: UIImage.menuBookmarksIcon) , handler: menuActionHandler),
        ])
        
        moreButton.menu = barButtonMenu
    }
}
