
import UIKit

class TextViewVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var txtView: UITextView!
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.text = AppConstants.textViewString
    }
}
