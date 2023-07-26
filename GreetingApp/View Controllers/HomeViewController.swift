
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
}

//MARK: - Actions
extension HomeViewController {
    @IBAction func onClickToUIComponents(_ sender: Any) {
        coordinator?.goToUiComponentsScreen()
    }
    
}
