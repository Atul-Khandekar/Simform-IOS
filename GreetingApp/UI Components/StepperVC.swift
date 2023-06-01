
import UIKit

class StepperVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var stepper: UIStepper!
    @IBOutlet weak private var lblChange: UILabel!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.wraps = false
        stepper.tintColor = .blue
    }
}

//MARK: - Actions
extension StepperVC {
    @IBAction private func stepperAction(_ sender: UIStepper) {
        stepper.value = sender.value
        lblChange.text = String(stepper.value)
        lblChange.font = UIFont(name: UIFont.folditExtraBold, size: 10)
        switch(sender.value) {
        case sender.maximumValue :
            lblChange.text = "Maximum value:\(sender.value)"
            lblChange.font = UIFont(name: UIFont.folditExtraBold, size: 10)
        case sender.minimumValue :
            lblChange.text = "Minimum value:\(sender.value)"
            lblChange.font = UIFont(name: UIFont.folditExtraBold, size: 10)
        default :
            break
        }
    }
}
