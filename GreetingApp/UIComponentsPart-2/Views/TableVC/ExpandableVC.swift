
import UIKit

class ExpandableVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var tblNames: UITableView!
    
    //MARK: - Variables
    private var expandableData: [ExpandableSectionDetails] = ExpandableSectionDetails.getData()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - UITableViewDataSource
extension ExpandableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandableData[section].visible ? expandableData[section].rows.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:AppConstants.ExpandableCell, for: indexPath) as? ExpandableCell else {
            return UITableViewCell()
        }
        cell.configureCell(model: expandableData[indexPath.section].rows[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ExpandableVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return expandableData.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionButton = UIButton()
        sectionButton.setTitle(expandableData[section].section , for: .normal)
        sectionButton.backgroundColor = .systemBlue
        sectionButton.tag = section
        sectionButton.addTarget(self, action: #selector(self.hideSection), for: .touchUpInside)
        return sectionButton
    }
}

//MARK: - @objc Methods
extension ExpandableVC {
    @objc
    private func hideSection(sender: UIButton) {
        let section = sender.tag
        expandableData[section].visible = !expandableData[section].visible
        tblNames.reloadData()
    }
}

//MARK: - setupView
extension ExpandableVC {
    private func setupView() {
        tblNames.register(UINib(nibName:AppConstants.ExpandableCell, bundle: nil), forCellReuseIdentifier: AppConstants.ExpandableCell)
        tblNames.delegate = self
        tblNames.dataSource = self
        tblNames.sectionHeaderTopPadding = 5
    }
}
