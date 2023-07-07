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
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.getRailwayTimeTable(offset: 0)
        viewModel.liveRailwayRecords.bind { [weak self] responseData in
            self?.railwayRecord = responseData
            self?.tblRailwaySchedule.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setActivityIndicator()
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
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
}

//MARK: - setupView
extension RailwayVC {
    private func setupView() {
        tblRailwaySchedule.register(UINib(nibName: AppConstants.railwayCell, bundle: nil), forCellReuseIdentifier: AppConstants.railwayCell)
        tblRailwaySchedule.delegate = self
        tblRailwaySchedule.dataSource = self
    }
}

//MARK: - UIScrollViewDelegate
extension RailwayVC: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = tblRailwaySchedule.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currentOffset <= 10.0 {
            tblRailwaySchedule.tableFooterView = activityIndicator
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loadData()
            }
            
        }
    }
}

//MARK: - loadData
extension RailwayVC {
    func loadData() {
        viewModel.getRailwayTimeTable(offset: railwayRecord?.count ?? .zero)
        tblRailwaySchedule.tableFooterView = nil
    }
}

//MARK: - setActivityIndicator
extension RailwayVC {
    private func setActivityIndicator() {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        activityIndicator.color = .link
        activityIndicator.startAnimating()
    }
}
