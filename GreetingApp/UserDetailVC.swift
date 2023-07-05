//
//  UserDetailVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 04/07/23.
//

import UIKit

class UserDetailVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var imgUserDetail: UIImageView!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var detailLodingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldJob: UITextField!
    
    @IBOutlet weak var textFieldUpdatedName: UITextField!
    @IBOutlet weak var textFieldUpdatedJob: UITextField!
    
    @IBOutlet weak var textFieldUpdateTime: UITextField!
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    var userDetailData: SingleUserData?
    var userUpdateViewModel = UserDetailViewModel()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLodingIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setupView()
            
        }
        userUpdateViewModel.updatedDetail.bind { updatedResponse in
            self.textFieldUpdatedName.text = updatedResponse?.name
            self.textFieldUpdatedJob.text = updatedResponse?.job
            self.textFieldUpdateTime.text = updatedResponse?.updatedAt
        }
    }
    
    @IBAction func onClickToUpdateDetails(_ sender: UIButton) {
        userUpdateViewModel.updateDetails(name: textFieldName.text ?? AppConstants.emptyString, job: textFieldJob.text ?? AppConstants.emptyString)
    }
    
}

//MARK: - setupView
extension  UserDetailVC {
    private func setupView() {
        
        if let id = userDetailData?.id {
            lblId.text = String(id)
        } else {
            lblId.text = "(Id)"
        }
        
        if let firstName = userDetailData?.firstName {
            lblFirstName.text = firstName
        } else {
            lblFirstName.text = "(First Name)"
        }
        
        if let lastName = userDetailData?.lastName {
            lblLastName.text = lastName
        } else {
            lblLastName.text = "(Last Name)"
        }
        
        if let email = userDetailData?.email {
            lblEmail.text = email
        } else {
            lblEmail.text = "(Email)"
        }
        
        if let url = URL(string: userDetailData?.avatar ?? AppConstants.emptyString) {
            imgUserDetail.load(url: url)
        } else {
            imgUserDetail.image = UIImage.getImage(UIImage.defaultImage)
        }
        detailLodingIndicator.stopAnimating()
    }
}
