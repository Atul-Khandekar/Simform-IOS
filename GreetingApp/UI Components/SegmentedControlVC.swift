
import UIKit

class SegmentedControlVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var segmentState: UISegmentedControl!
    @IBOutlet weak private var imgState: UIImageView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension SegmentedControlVC {
    @IBAction private func segmentChange(_ sender: UISegmentedControl) {
        switch SegmentControl(rawValue: sender.selectedSegmentIndex) {
        case .sunrise :
            imgState.image = UIImage(imageLiteralResourceName: "field")
        case .sunset :
            imgState.image = UIImage(imageLiteralResourceName: "beach_sunset")
        default:
            break
        }
    }
}

//MARK: - setupView
extension SegmentedControlVC {
    private func setupView() {
        segmentState.setTitle("Field Sunrise", forSegmentAt: 0)
        segmentState.setTitle("Beach Sunset", forSegmentAt: 1)
        segmentState.selectedSegmentIndex = 0
        imgState.image = UIImage(imageLiteralResourceName: "field")
    }
}
