
import UIKit
import Foundation

public protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class MainCoordinator: Coordinator {
    
    //MARK: - Variables
    var navigationController: UINavigationController
    let storyBoard = UIStoryboard(name: AppConstants.storyboardNavigationController, bundle: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - start
    func start() {
        guard let viewController = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.homeViewController) as? HomeViewController else {
            return
        }
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    //MARK: - goToSenderVC
    func goToSenderVC() {
        guard let senderVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.senderVC) as? SenderVC else {
            return
        }
        senderVC.coordinator =  self
        navigationController.pushViewController(senderVC, animated: true)
    }
    
    //MARK: - goToFirstVC
    func goToFirstVC() {
        guard let firstVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.firstViewController) as? FirstVC else {
            return
        }
        firstVC.coordinator = self
        navigationController.pushViewController(firstVC, animated: true)
    }
    
    //MARK: - goToReceiverVC
    func goToReceiverVC(text: String , viewController: UIViewController) {
        guard let receiverVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.receiverVC) as? ReceiverVC else {
            return
        }
        receiverVC.coordinator = self
        receiverVC.delegate = viewController as? SenderVC
        receiverVC.text = text
        navigationController.pushViewController(receiverVC, animated: true)
    }
    
    //MARK: - goToSecondVC
    func goToSecondVC() {
        guard let secondVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.secondViewController) as? SecondVC else {
            return
        }
        secondVC.coordinator = self
        navigationController.pushViewController(secondVC, animated: true)
    }
    
    //MARK: - goBackToViewController
    func goBackToViewController() {
        navigationController.popViewController(animated: true)
    }
    
    //MARK: - goToThirdVC
    func goToThirdVC() {
        guard let thirdVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.thirdViewController) as? ThirdVC else {
            return
        }
        thirdVC.coordinator = self
        navigationController.pushViewController(thirdVC, animated: true)
    }
    
    //MARK: - goToPresentVC
    func goToPresentVC() {
        guard let presentStylesVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.presentStylesVC) as? PresentStylesVC else {
            return
        }
        presentStylesVC.coordinator = self
        navigationController.pushViewController(presentStylesVC, animated: true)
    }
    
    //MARK: - goToFourthWithFullScreen
    func goToFourthWithFullScreen() {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator =  self
        fourthVC.modalPresentationStyle = .fullScreen
        navigationController.present(fourthVC, animated: true)
    }
    
    //MARK: - goToFourthWithCurrentContext
    func goToFourthWithCurrentContext() {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator = self
        fourthVC.modalPresentationStyle = .currentContext
        navigationController.present(fourthVC, animated: true)
    }
    
    //MARK: - backToHome
    func backToHome() {
        navigationController.popToRootViewController(animated: true)
    }
    
    //MARK: - backToNavigationController
    func backToNavigationController() {
        for viewController in navigationController.viewControllers {
            if viewController is NavigationControllerVC {
                navigationController.popToViewController(viewController, animated: true)
                break
            }
        }
    }
    
    //MARK: - goToFourthWithPageSheet
    func goToFourthWithPageSheet() {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator = self
        fourthVC.modalPresentationStyle = .pageSheet
        navigationController.present(fourthVC, animated: true)
    }
    
    //MARK: - goToFourthWithFormSheet
    func goToFourthWithFormSheet()  {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator = self
        fourthVC.modalPresentationStyle = .formSheet
        navigationController.present(fourthVC, animated: true)
    }
    
    //MARK: - goToFourthWithOverFullScreen
    func goToFourthWithOverFullScreen() {
        guard let fourthVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.fourthVC) as? FourthVC else {
            return
        }
        fourthVC.coordinator = self
        fourthVC.view.alpha = AppConstants.overFullScreenAlpha
        fourthVC.modalPresentationStyle = .overFullScreen
        navigationController.present(fourthVC, animated: true)
    }
    
    //MARK: - goToTextFieldVC
    func goToTextFieldVC() {
        guard let textFieldVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.textFieldVC) as? TextFieldVC else {
            return
        }
        textFieldVC.coordinator = self
        navigationController.pushViewController(textFieldVC, animated: true)
    }
    
    //MARK: - goToUiComponentsScreen
    func goToUiComponentsScreen() {
        guard let componentsVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.uiComponentsHomeScreen) as? UIComponentsHomeScreenVC else {
            return
        }
        componentsVC.coordinator = self
        navigationController.pushViewController(componentsVC, animated: true)
    }
    
    //MARK: - goToLabelVC
    func goToLabelVC() {
        guard let labelVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.labelVC) as? LabelVC else {
            return
        }
        labelVC.coordinator = self
        navigationController.pushViewController(labelVC, animated: true)
    }
    
    //MARK: - goToSwitchVC
    func goToSwitchVC() {
        guard let switchVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.switchVC) as? SwitchVC else {
            return
        }
        switchVC.coordinator = self
        navigationController.pushViewController(switchVC, animated: true)
    }
    
    //MARK: - goToNavigationControllVC
    func goToNavigationControllVC() {
        guard let navigationVC = storyBoard.instantiateViewController(withIdentifier: AppConstants.navigationControllerVC) as? NavigationControllerVC else {
            return
        }
        navigationVC.coordinator = self
        navigationController.pushViewController(navigationVC, animated: true)
    }
    
    //MARK: - goToTextViewVC
    func goToTextViewVC() {
        guard let textViewVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.textViewVC) as? TextViewVC else {
            return
        }
        textViewVC.coordinator = self
        navigationController.pushViewController(textViewVC, animated: true)
    }
    
    //MARK: - goToSliderVC
    func goToSliderVC() {
        guard let sliderVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.sliderVC) as? SliderVC else {
            return
        }
        sliderVC.coordinator = self
        navigationController.pushViewController(sliderVC, animated: true)
    }
    
    //MARK: - goToProgressViewVC
    func goToProgressViewVC() {
        guard let progressViewVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.progressViewVC) as? ProgressViewVC else {
            return
        }
        progressViewVC.coordinator = self
        navigationController.pushViewController(progressViewVC, animated: true)
    }
    
    //MARK: - goToSegmentControlVc
    func goToSegmentControlVc() {
        guard let segmentVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.segmentedControlVC) as? SegmentedControlVC else {
            return
        }
        segmentVC.coordinator = self
        navigationController.pushViewController(segmentVC, animated: true)
    }
    
    //MARK: - goToStepperVC
    func goToStepperVC() {
        guard let stepperVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.stepperVC) as? StepperVC else {
            return
        }
        stepperVC.coordinator = self
        navigationController.pushViewController(stepperVC, animated: true)
    }
    
    //MARK: - goToScrollViewVC
    func goToScrollViewVC() {
        guard let scrollView = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.scrollVC) as? ScrollVC else {
            return
        }
        scrollView.coordinator = self
        navigationController.pushViewController(scrollView, animated: true)
    }
    
    //MARK: - goToButtonVC
    func goToButtonVC() {
        guard let buttonVC = Storyboards.uiComponentsPart1.instantiateViewController(withIdentifier: AppConstants.buttonVC) as? ButtonVC else {
            return
        }
        buttonVC.coordinator = self
        navigationController.pushViewController(buttonVC, animated: true)
    }
    
    //MARK: - goToTableViewVC
    func goToTableViewVC() {
        guard let tableVC = Storyboards.uiComponentsSecondPart.instantiateViewController(withIdentifier: AppConstants.tableViewVC) as? TableViewVC else {
            return
        }
        tableVC.coordinator = self
        navigationController.pushViewController(tableVC, animated: true)
    }
    
    //MARK: - goToCollectionViewVC
    func goToCollectionViewVC() {
        guard let booksCollectionVC = Storyboards.uiComponentsSecondPart.instantiateViewController(withIdentifier: AppConstants.collectionViewVC) as? BooksCollectionVC else {
            return
        }
        booksCollectionVC.coordinator = self
        navigationController.pushViewController(booksCollectionVC, animated: true)
    }
    
    //MARK: - goToSearchBarVc
    func goToSearchBarVc() {
        guard let searchBarVC = Storyboards.searchBar.instantiateViewController(withIdentifier: AppConstants.searchBarVC) as? SearchBarVC else {
            return
        }
        searchBarVC.coordinator = self
        navigationController.pushViewController(searchBarVC, animated: true)
    }
    
    //MARK: - goToStackViewAndToolBarVC
    func goToStackViewAndToolBarVC() {
        guard let stackViewAndToolBarVC = Storyboards.stackViewAndToolBar.instantiateViewController(withIdentifier: AppConstants.stackViewVC) as? StackViewVC else {
            return
        }
        stackViewAndToolBarVC.coordinator = self
        navigationController.pushViewController(stackViewAndToolBarVC, animated: true)
    }
    
    //MARK: - goToTabBarVC
    func goToTabBarVC() {
        guard let tabBarVC = Storyboards.tabBar.instantiateViewController(withIdentifier: AppConstants.tabBarVC) as? TabBarVC else {
            return
        }
        tabBarVC.coordinator = self
        navigationController.pushViewController(tabBarVC, animated: true)
    }
    
    //MARK: - goToImagePickerVC
    func goToImagePickerVC() {
        guard let imagePickerVC = Storyboards.imagePicker.instantiateViewController(withIdentifier: AppConstants.imagePickerVC) as? ImagePickerVC else {
            return
        }
        imagePickerVC.coordinator = self
        navigationController.pushViewController(imagePickerVC, animated: true)
    }
    
    //MARK: - goToPickerView
    func goToPickerView() {
        guard let pickerVC = Storyboards.pickerView.instantiateViewController(withIdentifier: AppConstants.pickerViewVC) as? PickerViewVC else {
            return
        }
        pickerVC.coordinator = self
        navigationController.pushViewController(pickerVC, animated: true)
    }
    
    //MARK: - goToMapViewVC
    func goToMapViewVC() {
        guard let mapViewVC = Storyboards.mapView.instantiateViewController(withIdentifier: AppConstants.mapViewVC) as? MapViewVC else {
            return
        }
        mapViewVC.coordinator = self
        navigationController.pushViewController(mapViewVC, animated: true)
    }
    
    //MARK: - goToWebViewVC
    func goToWebViewVC() {
        guard let webViewVC = Storyboards.uiComponentsSecondPart.instantiateViewController(withIdentifier: AppConstants.geeksForGeeksWebViewVC) as? GeeksForGeeksWebView else {
            return
        }
        webViewVC.coordinator = self
        navigationController.pushViewController(webViewVC, animated: true)
    }
    
    //MARK: - goToUserTableVC
    func goToUserTableVC() {
        guard let userTableVc = Storyboards.uiComponentsSecondPart.instantiateViewController(withIdentifier: AppConstants.userTableViewVC) as? UserTableViewVC else {
            return
        }
        userTableVc.coordinator = self
        navigationController.pushViewController(userTableVc, animated: true)
    }
    
    //MARK: - goToExpandableSectionVC
    func goToExpandableSectionVC() {
        guard let expandableVC = Storyboards.uiComponentsSecondPart.instantiateViewController(withIdentifier: AppConstants.expandableSectionsVC) as? ExpandableVC else {
            return
        }
        expandableVC.coordinator = self
        navigationController.pushViewController(expandableVC, animated: true)
    }
    
    //MARK: - goToCustomTableVC
    func goToCustomTableVC() {
        guard let customVC = Storyboards.uiComponentsSecondPart.instantiateViewController(withIdentifier: AppConstants.customTableVC) as? CustomTableVC else {
            return
        }
        customVC.coordinator = self
        navigationController.pushViewController(customVC, animated: true)
    }
    
    func goToOnboardingScreenVc() {
        guard let onboardingVC = Storyboards.onBoardingScreen.instantiateViewController(withIdentifier: AppConstants.onBoardingScreenVC) as? OnboardingScreenVC else {
            return
        }
        onboardingVC.coordinator = self
        navigationController.pushViewController(onboardingVC, animated: true)
    }
    
    //MARK: - goToParkingLotVC
    func goToParkingLotVC() {
        guard let parkingLotVC = Storyboards.parkingLotScreen.instantiateViewController(withIdentifier: AppConstants.parkingLotVC) as? ParkingLotVC else {
            return
        }
        parkingLotVC.coordinator = self
        navigationController.pushViewController(parkingLotVC, animated: true)
    }
    
    //MARK: - goToProfileScreen
    func goToProfileScreen() {
        guard let profileScreenVC = Storyboards.profileScreen.instantiateViewController(withIdentifier: AppConstants.profileScreenVC) as? ProfileScreenVC else {
            return
        }
        profileScreenVC.coordinator = self
        navigationController.pushViewController(profileScreenVC, animated: true)
    }
    
    //MARK: -  goToChangeEmailVC
    func goToChangeEmailVC() {
        guard let changeEmailVC = Storyboards.profileScreen.instantiateViewController(withIdentifier: AppConstants.changeEmailVC) as? ChangeEmailVC else {
            return
        }
        changeEmailVC.coordinator = self
        changeEmailVC.modalPresentationStyle = .overCurrentContext
        navigationController.present(changeEmailVC, animated: true)
    }
    
    //MARK: - goToCloseAccountVC
    func goToCloseAccountVC() {
        guard let closeAccountVC = Storyboards.profileScreen.instantiateViewController(withIdentifier: AppConstants.closeAccountVC) as? CloseAccountVC else {
            return
        }
        closeAccountVC.coordinator = self
        closeAccountVC.modalPresentationStyle = .formSheet
        if let sheet = closeAccountVC.sheetPresentationController {
            sheet.detents = [
                .custom { _ in
                    return AppConstants.closeAccountHeight
                }
            ]
        }
        navigationController.present(closeAccountVC, animated: true)
    }
}
