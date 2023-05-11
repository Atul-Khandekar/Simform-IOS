
import UIKit

class ScrollVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var txtScrollView: UILabel!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 10, height: 10)
    }
}
//MARK: - UIScrollViewDelegate
extension ScrollVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        txtScrollView.text = "scrolling ...... "
    }
}
