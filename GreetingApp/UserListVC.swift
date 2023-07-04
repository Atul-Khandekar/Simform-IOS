//
//  UserListVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 04/07/23.
//

import UIKit

class UserListVC: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var tblUserList: UITableView!
    @IBOutlet weak var pageSegmentControl: UISegmentedControl!
    
    //MARK: - Variables
    let viewModel = UserListViewModel()
    weak var coordinator: MainCoordinator?
    var list: UserListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.getUserList(page: UserListPageNumberSegment.first.rawValue + 1){ [weak self] responseList in
            self?.list = responseList
            self?.tblUserList.reloadData()
        }
    }
    
    @IBAction func onClickToGetUserList(_ sender: UISegmentedControl) {
        switch pageSegmentControl.selectedSegmentIndex {
        case UserListPageNumberSegment.first.rawValue :
            viewModel.getUserList(page: UserListPageNumberSegment.first.rawValue + 1) { [weak self] responseList in
                self?.list = responseList
                self?.tblUserList.reloadData()
            }
            
        case UserListPageNumberSegment.second.rawValue :
            viewModel.getUserList(page: UserListPageNumberSegment.second.rawValue + 1 ) { [weak self] responseList in
                self?.list = responseList
                self?.tblUserList.reloadData()
            }
            
        default:
            break
        }
    }
}

//MARK: - setupView
extension UserListVC {
    private func setupView() {
        tblUserList.register(UINib(nibName: AppConstants.userListCellTableViewCell, bundle: nil), forCellReuseIdentifier: AppConstants.userListCellTableViewCell)
        tblUserList.dataSource = self
        tblUserList.delegate = self
        
    }
}

//MARK: - UITableViewDataSource
extension UserListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.data?.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.userListCellTableViewCell) as? UserListCellTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(list: list?.data?[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension UserListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/AppConstants.userListHeightDivider
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AppConstants.userListSectionCount
    }
}
