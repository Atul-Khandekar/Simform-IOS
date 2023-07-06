//
//  RailwayVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import UIKit

class RailwayVC: UIViewController {

    @IBOutlet weak var tblRailwaySchedule: UITableView!
    
    //MARK: - Variables
    let viewModel = RailwayViewModel()
    weak var coordinator: MainCoordinator?
    var railwayRecord: [RailwayRecord]?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.getRailwayTimeTable(offset: 100000)
        viewModel.railwayResponseData.bind { [weak self] responseData in
            self?.railwayRecord = responseData?.records
            self?.tblRailwaySchedule.reloadData()
        }
    }
   
}

//MARK: - UITableViewDataSource
extension RailwayVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return railwayRecord?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.railwayCell , for: indexPath) as? RailwayCell else {
            return UITableViewCell()
        }
        if let data = railwayRecord?[indexPath.row] {
            cell.configureCell(data: data)
        }
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension RailwayVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

//MARK: - setupView
extension RailwayVC {
    private func setupView() {
        tblRailwaySchedule.register(UINib(nibName: AppConstants.railwayCell, bundle: nil), forCellReuseIdentifier: AppConstants.railwayCell)
        tblRailwaySchedule.delegate = self
        tblRailwaySchedule.dataSource = self
    }
}
