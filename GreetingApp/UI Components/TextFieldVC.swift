
import UIKit

class TextFieldVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak private var iconTextField:UITextField!
    @IBOutlet weak private var password: UITextField!
    
    // MARK: - Variables
    private var showHide: UIButton! = UIButton()
    
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
        self.iconTextField.delegate = self
        self.password.delegate = self
        password.placeholder = "password"
        password.contentHorizontalAlignment = .left
        password.textAlignment = .left
        rightIcon(UIImage(imageLiteralResourceName: "show"))
    }
}

//MARK: - View Methods
extension TextFieldVC {
    private func rightIcon(_ image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: -5, y: 5, width: 15, height: 15))
        imageView.image = image
        let imgContinerview = UIView(frame: CGRect(x: -10, y: 10, width: 25, height: 25))
        imgContinerview.addSubview(imageView)
        password.rightView = imgContinerview
        password.rightViewMode = .always
    }
}
