
import UIKit

class ProgressViewVC: UIViewController {
    
    //MARK: - Outltets
    @IBOutlet weak private var btnStart: UIButton!
    @IBOutlet weak private var progressView: UIProgressView!
    
    //MARK: - Variables
    private var isRunning = false
    private var progressBarTimer: Timer!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions
extension ProgressViewVC {
    @IBAction private func btnAction(_ sender: UIButton) {
        
        if isRunning {
            progressBarTimer.invalidate()
            btnStart.setTitle(ProgressViewStates.start.rawValue, for: .normal)
        } else {
            btnStart.setTitle(ProgressViewStates.stop.rawValue, for: .normal)
            progressView.progress = AppConstants.ProgressViewMinimumProgress
            progressBarTimer = Timer.scheduledTimer(timeInterval: AppConstants.ProgressViewTimeInterval, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        }
        isRunning = !isRunning
    }
}

//MARK: - View Methods
extension ProgressViewVC {
    private func setupView() {
        progressView.progress = AppConstants.ProgressViewMinimumProgress
        progressView.progressViewStyle = .default
    }
}

//MARK: - @objc Methods
extension ProgressViewVC {
    @objc func updateProgressView() {
        progressView.progress += AppConstants.ProgressViewProgress
        progressView.setProgress(progressView.progress, animated: true)
        if progressView.progress == AppConstants.ProgressViewMaximumProgress {
            progressBarTimer.invalidate()
            isRunning = false
            btnStart.setTitle(ProgressViewStates.start.rawValue, for: .normal)
        }
    }
}
