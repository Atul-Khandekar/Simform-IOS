
import UIKit

class UserTableViewVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var tblViewExample: UITableView!
    
    //MARK: - Variables
    private let model:[UserDetails] = UserDetails.getData()
    weak var coordinator: MainCoordinator?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - UITableViewDelegate
extension UserTableViewVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model[section].section
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.layer.cornerRadius = 10
        cell?.layer.borderColor = UIColor.blue.cgColor
        cell?.layer.borderWidth = 5
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.layer.borderColor = UIColor.clear.cgColor
    }
}

//MARK: - UITableViewDataSource
extension UserTableViewVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.userTableViewCell , for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let value =  model[indexPath.section].rows[indexPath.row]
        cell.configureCell( data: model[indexPath.section].rows[indexPath.row] )
        return cell
    }
}

//MARK: - setupView
extension UserTableViewVC {
    private func setupView() {
        tblViewExample.delegate = self
        tblViewExample.dataSource = self
        tblViewExample.allowsMultipleSelection = true
        tblViewExample.estimatedRowHeight = 100
        tblViewExample.rowHeight = UITableView.automaticDimension
    }
}
