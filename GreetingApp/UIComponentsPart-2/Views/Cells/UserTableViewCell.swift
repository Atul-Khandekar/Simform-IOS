
import UIKit

class UserTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak private var lblNameCellExample: UILabel!
    @IBOutlet weak private var imgCellExample: UIImageView!
}

//MARK: - configureCell
extension UserTableViewCell {
    func configureCell( data: String) {
        imgCellExample.image = UIImage(imageLiteralResourceName: UIImage.userIcon)
        lblNameCellExample.text = data
    }
}
