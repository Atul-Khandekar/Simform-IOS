
import UIKit

class SliderVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    //MARK: - Variables
    let step: Float = 5
    weak var coordinator: MainCoordinator?

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - setupView
extension SliderVC {
    private func setupView() {
        slider.minimumValue = Float(Slider.min.rawValue)
        slider.maximumValue = Float(Slider.max.rawValue)
        progress.text = String(Int(slider.value))
    }
}

//MARK: - Actions
extension SliderVC {
    @IBAction private func sliderChange(_ sender: UISlider) {
        let temp = round(sender.value / step) * step
        progress.text = String(Int(temp))
    }
}
