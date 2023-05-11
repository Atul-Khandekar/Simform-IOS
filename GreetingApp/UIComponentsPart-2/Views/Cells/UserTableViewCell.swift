
import UIKit

class UserTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak private var nameCellExample: UILabel!
    @IBOutlet weak private var imgCellExample: UIImageView!
}

//MARK: - configureCell
extension UserTableViewCell {
    func configureCell( data: [UserDetails] ,  indexPath: IndexPath ) {
        self.imgCellExample.image = UIImage(imageLiteralResourceName: "user-icon")
        self.nameCellExample.text = data[indexPath.section].rows[indexPath.row]
    }
}
