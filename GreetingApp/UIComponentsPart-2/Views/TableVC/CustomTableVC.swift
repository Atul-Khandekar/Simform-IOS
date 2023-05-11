
import UIKit

class CustomTableVC: UIViewController {
    
    //MARK: - Variables
    private var data = CustomNames.getData()
    private let btnAdd: UIButton = {
        let button = UIButton()
        button.setTitle("Add data", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CustomCell.self, forCellReuseIdentifier: AppConstant.CustomCell)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraint()
    }
}

//MARK: - UITableViewDataSource
extension CustomTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstant.CustomCell, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.configureCell(data: data, indexPath: indexPath)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CustomTableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}

//MARK: - setupView
extension CustomTableVC {
    private func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        view.addSubview(btnAdd)
        btnAdd.addTarget(self, action: #selector(addData), for: .touchUpInside)
    }
}

//MARK: - setConstraint
extension CustomTableVC {
    private func setConstraint() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(btnAdd.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50))
        constraints.append(btnAdd.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50))
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0))
        NSLayoutConstraint.activate(constraints)
    }
}

//MARK: - @objc Methods
extension CustomTableVC {
    @objc
    private func addData() {
        let alert  = UIAlertController(title: "Add Name", message: "Please enter your name ", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "First letter should be capital "
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            guard let field = alert.textFields else {
                return
            }
            let name = field[0]
            self.data.append(CustomNames(name: name.text ?? "Couldn't add name"))
            self.tableView.insertRows(at: [IndexPath(row: self.data.count - 1, section: 0)], with: .left)
            
        }))
        present(alert,animated: true)
    }
}
