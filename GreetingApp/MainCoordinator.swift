//
//  FirstCoordinator.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 30/05/23.
//
import UIKit
import Foundation

public protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    let storyBoard = UIStoryboard(name: AppConstants.storyboardNavigationController, bundle: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let firstVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.navigationControllerVC ) as? NavigationControllerVC else {
            return
        }
        firstVC.coordinator = self
        navigationController.pushViewController(firstVC, animated: true)
    }
    
    func goToSenderVC() {
        guard let senderVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.senderVC) as? SenderVC else {
            return
        }
        senderVC.coordinator =  self
        navigationController.pushViewController(senderVC, animated: true)
    }
    
    func goToFirstVC() {
        guard let firstVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.firstViewController) as? FirstVC else {
            return
        }
        firstVC.coordinator = self
        navigationController.pushViewController(firstVC, animated: true)
    }
    
    func goToReceiverVC(text: String , viewController: UIViewController) {
        guard let receiverVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.receiverVC) as? ReceiverVC else {
            return
        }
        receiverVC.coordinator = self
        receiverVC.delegate = viewController as? SenderVC
        receiverVC.text = text
        navigationController.pushViewController(receiverVC, animated: true)
    }
    
    func goToSecondVC() {
        guard let secondVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.secondViewController) as? SecondVC else {
            return
        }
        secondVC.coordinator = self
        navigationController.pushViewController(secondVC, animated: true)
    }
    
    func goBackToViewController() {
        navigationController.popViewController(animated: true)
    }
    
    func goToThirdVC() {
        guard let thirdVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.thirdViewController) as? ThirdVC else {
            return
        }
        thirdVC.coordinator = self
        navigationController.pushViewController(thirdVC, animated: true)
    }
    
    func goToPresentVC() {
        guard let presentStylesVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.presentStylesVC) as? PresentStylesVC else {
            return
        }
        presentStylesVC.coordinator = self
        navigationController.pushViewController(presentStylesVC, animated: true)
    }
    
    func goToFourthWithFullScreen() {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator =  self
        fourthVC.modalPresentationStyle = .fullScreen
        navigationController.present(fourthVC, animated: true)
    }
    
    func goToFourthWithCurrentContext() {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator = self
        fourthVC.modalPresentationStyle = .currentContext
        navigationController.present(fourthVC, animated: true)
    }
    
    func backToHome() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func backToNavigationController() {
        for viewController in navigationController.viewControllers {
            if viewController is NavigationControllerVC {
                navigationController.popToViewController(viewController, animated: true)
                break
            }
        }
    }
    
    func goToFourthWithPageSheet() {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator = self
        fourthVC.modalPresentationStyle = .pageSheet
        navigationController.present(fourthVC, animated: true)
    }
    
    func goToFourthWithFormSheet()  {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator = self
        fourthVC.modalPresentationStyle = .formSheet
        navigationController.present(fourthVC, animated: true)
    }
    
    func goToFourthWithOverFullScreen() {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator = self
        fourthVC.view.alpha = AppConstants.overFullScreenAlpha
        fourthVC.modalPresentationStyle = .overFullScreen
        navigationController.present(fourthVC, animated: true)
    }
}
