
import UIKit

class ExpandableCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak private var lblCell: UILabel!
    
    //MARK: - Overriden Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        lblCell.text = nil
    }
}

//MARK: - configureCell
extension ExpandableCell {
    
    func configureCell(model: [ExpandableSectionDetails] , indexPath: IndexPath) {
        lblCell.text = model[indexPath.section].rows[indexPath.row]
    }
}
