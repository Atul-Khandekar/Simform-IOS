
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
        super.init(style: .default, reuseIdentifier: AppConstants.customCell)
        addSubview(lblText)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented ")
    }
    
    //MARK: - Overriden Methods
    override func prepareForReuse() {
        lblText.text = nil
    }
}

//MARK: - configureCell
extension CustomCell {
    
    func configureCell(data: CustomNames ) {
       lblText.text = data.name
    }
}
//MARK: - setConstraints
extension CustomCell {
    private func setConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(lblText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0))
        constraints.append(lblText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0))
        constraints.append(lblText.topAnchor.constraint(equalTo: topAnchor, constant: 0))
        constraints.append(lblText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
}
