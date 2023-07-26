
import UIKit

class BooksCollectionCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak private var imgOfBook: UIImageView!
}

//MARK: - configureCell
extension BooksCollectionCell {
    func configureCell(data: Any) {
        guard let data = data as? UIImage else {
            return
        }
        imgOfBook.image = data
    }
}
