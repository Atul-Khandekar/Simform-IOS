
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
            imgState.image = UIImage(imageLiteralResourceName: UIImage.Field)
        case .sunset :
            imgState.image = UIImage(imageLiteralResourceName: UIImage.BeachSunset)
        default:
            break
        }
    }
}

//MARK: - setupView
extension SegmentedControlVC {
    private func setupView() {
        segmentState.setTitle(AppConstants.segmentSunriseTitle, forSegmentAt: SegmentControl.sunrise.rawValue )
        segmentState.setTitle(AppConstants.segmentSunsetTitle, forSegmentAt: SegmentControl.sunset.rawValue)
        segmentState.selectedSegmentIndex = SegmentControl.sunrise.rawValue
        imgState.image = UIImage(imageLiteralResourceName: UIImage.Field)
    }
}
