//
//  ProfileScreenVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 05/06/23.
//

import UIKit

class ProfileScreenVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var imgProfilePicture: UIImageView!
    @IBOutlet weak private var textViewAddress: UITextView!
    @IBOutlet weak private var loginView: UIView!
    @IBOutlet weak private var closeAccountView: UIView!
    @IBOutlet weak private var btnEditProfile: UIButton!
    @IBOutlet weak private var textFieldFirstName: UITextField!
    @IBOutlet weak private var textFieldMobile: UITextField!
    @IBOutlet weak private var textFieldCountry: UITextField!
    @IBOutlet weak private var textFieldZipcode: UITextField!
    @IBOutlet weak private var textFieldState: UITextField!
    @IBOutlet weak private var textFieldCity: UITextField!
    @IBOutlet weak private var textFieldLastName: UITextField!
    @IBOutlet weak var scrollViewMain: UIScrollView!
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    lazy var  navBar = navigationController?.navigationBar
    let lblProfileScreenTitle: UILabel = {
        let label = UILabel()
        label.text = AppConstants.profileScreenNavigationTitle
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let statusBarFrame = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame
        let view = UIView(frame: statusBarFrame ?? CGRect())
        view.backgroundColor = UIColor(named: CustomColor.reverseKTNavigationBarColor)
        UIApplication.shared.windows.first?.addSubview(view)
        navigationController?.navigationBar.tintColor = .white
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(named: CustomColor.reverseKTNavigationBarColor)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        let whiteStatusBar = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame
        let barView = UIView(frame: whiteStatusBar ?? CGRect())
        barView.backgroundColor = UIColor.white
        UIApplication.shared.windows.first?.addSubview(barView)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("view disappeared")
        navigationController?.navigationBar.tintColor = .blue
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}

//MARK: - setupView
extension ProfileScreenVC {
    private func setupView() {
        if let _ = navigationController?.viewControllers.contains(self) {
            navigationController?.navigationBar.tintColor = .white
        }
        
        textFieldFirstName.delegate = self
        textFieldLastName.delegate = self
        textFieldCity.delegate = self
        textFieldState.delegate = self
        textFieldZipcode.delegate = self
        textFieldCountry.delegate = self
        textFieldMobile.delegate = self
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.hidesBackButton = true
        navigationItem.titleView = lblProfileScreenTitle
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: UIImage.parkingLotMenu , withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: AppConstants.profileScreenRightBarButtonTitle , style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)], for: .normal)
        
        btnEditProfile.layer.cornerRadius = 0.5 * btnEditProfile.frame.size.width
        btnEditProfile.setBackgroundImage(UIImage(systemName: UIImage.iconPencil), for: .normal)
        
        imgProfilePicture.layer.cornerRadius = 0.5 * imgProfilePicture.frame.size.width
        
        textViewAddress.layer.borderWidth = AppConstants.profileScreenViewBorderWidth
        textViewAddress.layer.borderColor = UIColor(named: CustomColor.profileScreenBorderColor)?.cgColor
        textViewAddress.layer.cornerRadius = AppConstants.profileScreenViewCornerRadius
        textViewAddress.textContainer.maximumNumberOfLines = AppConstants.profileSCreenAddressMaxLines
        
        loginView.layer.borderColor = UIColor(named: CustomColor.profileScreenBorderColor)?.cgColor
        loginView.layer.borderWidth = AppConstants.profileScreenViewBorderWidth
        loginView.layer.cornerRadius = AppConstants.profileScreenViewCornerRadius
        
        closeAccountView.layer.borderColor = UIColor(named: CustomColor.profileScreenBorderColor)?.cgColor
        closeAccountView.layer.borderWidth = AppConstants.profileScreenViewBorderWidth
        closeAccountView.layer.cornerRadius = AppConstants.profileScreenViewCornerRadius
    }
}

//MARK: - UITextFieldDelegate {
extension ProfileScreenVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - UINavigationControllerDelegate
extension ProfileScreenVC: UINavigationControllerDelegate {
    @IBAction private func onClickChangeProfile(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        present(imageController, animated: true)
    }
}

//MARK: - UIImagePickerControllerDelegate
extension ProfileScreenVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imgProfilePicture.image = image
        }
        picker.dismiss(animated: true)
    }
}

//MARK: - Actions
extension ProfileScreenVC {
    
    @IBAction private func onClickChangeEmail(_ sender: UIButton) {
        coordinator?.goToChangeEmailVC()
        
    }
    
    @IBAction private func onClickToCloseAccount(_ sender: UIButton) {
        coordinator?.goToCloseAccountVC()
    }
}

//MARK: - @objc Methods
extension ProfileScreenVC {
    @objc func keyboardWillShow(notification:NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = scrollViewMain.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollViewMain.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollViewMain.contentInset = contentInset
    }
}

//MARK: - UIGestureRecognizerDelegate
extension ProfileScreenVC : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
