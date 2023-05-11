
import UIKit

class ButtonVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var alter: UIButton!
    
    //MARK: - Variables
    private var tap = true
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Actions
extension ButtonVC {
    
    @IBAction private func alterBtn(_ sender: Any) {
        if tap {
            view.backgroundColor = .orange
            alter.layer.cornerRadius = 10
            alter.layer.borderWidth  = 4
            alter.configuration = .plain()
            switch(alter.state) {
            case .selected:
                print("this is selected ")
            case .highlighted:
                print("highlighted")
            case .normal:
                print("normal")
            default:
                print("default")
            }
            tap = false
        } else {
            view.backgroundColor = .blue
            alter.layer.cornerRadius = 0
            alter.configuration = .filled()
            tap = true
        }
    }
}
