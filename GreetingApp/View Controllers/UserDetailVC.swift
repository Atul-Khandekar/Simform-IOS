//
//  UserDetailVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 04/07/23.
//

import UIKit

class UserDetailVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var imgUserDetail: UIImageView!
    @IBOutlet weak private var lblId: UILabel!
    @IBOutlet weak private var lblFirstName: UILabel!
    @IBOutlet weak private var lblEmail: UILabel!
    @IBOutlet weak private var lblLastName: UILabel!
    @IBOutlet weak private var detailLodingIndicator: UIActivityIndicatorView!
    @IBOutlet weak private var lblUpdatedName: UILabel!
    @IBOutlet weak private var lblUpdatedJob: UILabel!
    @IBOutlet weak private var lblUpdatedAt: UILabel!
    @IBOutlet weak private var UpdatedDetailsStack: UIStackView!
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    var userDetailData: SingleUserData?
    var userUpdateViewModel = UserDetailViewModel()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdatedDetailsStack.isHidden = true
        detailLodingIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setupView()
        }
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
        
        
        userUpdateViewModel.updatedDetail.bind { [weak self] details in
            self?.lblUpdatedName.text = details?.name
            self?.lblUpdatedJob.text = details?.job
            self?.lblUpdatedAt.text = details?.updatedAt
            self?.UpdatedDetailsStack.isHidden = false
        }
    }
}

//MARK: - Actions
extension UserDetailVC {
    @IBAction private func onClickToEdit(_ sender: UIButton) {
        self.showEditAlert(title: "Update Details" , message: "Enter your details here to update") { [weak self] requestModel in
            self?.userUpdateViewModel.updateDetails(name: requestModel.name ?? AppConstants.emptyString, job: requestModel.job ?? AppConstants.emptyString)
            
        }
    }
    
    @IBAction func onClickToUploadImageVC(_ sender: UIButton) {
        coordinator?.goToUploadImageVC()
    }
    
}
