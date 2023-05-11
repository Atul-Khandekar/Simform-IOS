
import UIKit

class CustomCell: UITableViewCell {
    
    //MARK: - Variables
    private let lblText: UILabel = {
        let label = UILabel()
        label.text = "hello"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: AppConstant.CustomCell)
        addSubview(lblText)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented ")
    }
    
    //MARK: - Overriden Methods
    override func prepareForReuse() {
        self.lblText.text = nil
    }
}

//MARK: - configureCell
extension CustomCell {

    func configureCell(data: [CustomNames] , indexPath: IndexPath ) {
        self.lblText.text = data[indexPath.row].name
    }
}
//MARK: - setConstraints
extension CustomCell {
    private func setConstraints() {
        lblText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        lblText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        lblText.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        lblText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
