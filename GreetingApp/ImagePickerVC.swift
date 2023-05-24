//
//  ImagePickerVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 17/05/23.
//

import UIKit

class ImagePickerVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var imgSelectedFromAlbum: UIImageView!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Actions
extension ImagePickerVC: UINavigationControllerDelegate {
    @IBAction func selectImage(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        present(imageController, animated: true)
    }
}

//MARK: - UIImagePickerControllerDelegate
extension ImagePickerVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imgSelectedFromAlbum.image = image
        }
        picker.dismiss(animated: true)
    }
}
