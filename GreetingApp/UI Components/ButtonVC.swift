
import UIKit

class ButtonVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var btnAlter: UIButton!
    
    //MARK: - Variables
    private var tap = true
    weak var coordinator: MainCoordinator?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Actions
extension ButtonVC {
    
    @IBAction private func changeState(_ sender: Any) {
        if tap {
            view.backgroundColor = .orange
            btnAlter.layer.cornerRadius = CGFloat(AppConstants.switchCornerRadius)
            btnAlter.layer.borderWidth  = AppConstants.borderWidth
            btnAlter.configuration = .plain()
            switch(btnAlter.state) {
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
            btnAlter.layer.cornerRadius = .zero
            btnAlter.configuration = .filled()
            tap = true
        }
    }
}
