
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
            btnStart.setTitle("Start", for: .normal)
        } else {
            btnStart.setTitle("Stop", for: .normal)
            progressView.progress = 0.0
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        }
        isRunning = !isRunning
    }
}

//MARK: - View Methods
extension ProgressViewVC {
    private func setupView() {
        progressView.progress = 0.0
        progressView.progressViewStyle = .default
    }
}

//MARK: - @objc Methods
extension ProgressViewVC {
    @objc func updateProgressView() {
        progressView.progress += 0.1
        progressView.setProgress(progressView.progress, animated: true)
        if progressView.progress == 1.0 {
            progressBarTimer.invalidate()
            isRunning = false
            btnStart.setTitle("Start", for: .normal)
        }
    }
}
