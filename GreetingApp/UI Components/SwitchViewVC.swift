
import UIKit

class SwitchViewVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var lblInfo: UILabel!
    @IBOutlet weak private var enterName: UITextField!
    @IBOutlet weak private var stateOnOff: UISwitch!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        enterName.delegate = self
    }
}

//MARK: - UITextFieldDelegate
extension SwitchViewVC: UITextFieldDelegate {
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - Actions
extension SwitchViewVC {
    
    @IBAction private func switchState(_ sender: UISwitch) {
        if stateOnOff.isOn {
            print(stateOnOff.isOn)
            lblInfo.text = "Editing is enabled"
            enterName.isEnabled = true
            sender.onTintColor = .systemGreen
            sender.backgroundColor = .clear
        } else {
            print(stateOnOff.isOn)
            lblInfo.text = "Editing is diabled"
            enterName.isEnabled = false
            sender.backgroundColor = .systemRed
            sender.layer.cornerRadius = 15
        }
    }
}
