//
//  UploadImageVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import UIKit

class UploadImageVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var imgFromServer: UIImageView!
    @IBOutlet weak var lblImageUploadStatus: UILabel!
    @IBOutlet weak var textViewImageUrl: UITextView!
    @IBOutlet weak var btnUploadImage: UIButton!
    
    //MARK: - Variables
    var imageUrl: URL? = nil
    let viewModel = UploadImageViewModel()
    weak var coordinator: MainCoordinator?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnUploadImage.isHidden = true
        viewModel.imageUrl.bind { url in
            self.textViewImageUrl.text = url
            self.lblImageUploadStatus.text = "Image Uploaded"
           
        }
    }
}

//MARK: - Actions
extension UploadImageVC: UINavigationControllerDelegate {
    @IBAction func onClickToPickImage(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        present(imageController, animated: true)
    }
    
    @IBAction func onClickToUploadImage(_ sender: UIButton) {
        guard let image = imgFromServer.image else {
            return
        }
        viewModel.uploadImage(image: image)
    }
}

//MARK: - UIImagePickerControllerDelegate
extension UploadImageVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imgFromServer.image = image
            self.btnUploadImage.isHidden = false
        }
        picker.dismiss(animated: true)
    }
}
