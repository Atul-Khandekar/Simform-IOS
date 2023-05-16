
import UIKit

class TextFieldVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak private var txtIcon: UITextField!
    @IBOutlet weak private var txtPassword: UITextField!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - UITextFieldDelegate
extension TextFieldVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - setupView
extension TextFieldVC {
    
    private func setupView() {
        txtIcon.delegate = self
        txtPassword.delegate = self
        txtPassword.placeholder = AppConstants.TextFieldPasswordPlaceholder
        txtPassword.contentHorizontalAlignment = .left
        txtPassword.textAlignment = .left
        rightIcon(UIImage(imageLiteralResourceName: UIImage.Show))
    }
}

//MARK: - View Methods
extension TextFieldVC {
    private func rightIcon(_ image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: -5, y: 5, width: 15, height: 15))
        imageView.image = image
        let imgContainerView = UIView(frame: CGRect(x: -10, y: 10, width: 25, height: 25))
        imgContainerView.addSubview(imageView)
        txtPassword.rightView = imgContainerView
        txtPassword.rightViewMode = .always
    }
}
