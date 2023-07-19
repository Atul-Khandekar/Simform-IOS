//
//  ParkingLotVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 02/06/23.
//

import UIKit

class ParkingLotVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var segmentParkingLot: UISegmentedControl!
    @IBOutlet weak private var tableViewParkingLot: UITableView!
    @IBOutlet weak private var viewBottom: UIView!
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    lazy var navBar = navigationController?.navigationBar
    var parkingLots = ParkingLotModel.getParkingLotModel()
    var parkingLotTimeSheets = ParkingLotModel.getParkingLotTimeSheetData()
    let lblTitle: UILabel = {
        let label = UILabel()
        label.text = AppConstants.parkingLotTitle
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textAlignment = .center
        return label
    }()
    let btnResume: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: AppConstants.parkingLotResumeIcon), for: .normal)
        button.backgroundColor = UIColor(named: CustomColor.parkingLotNavigationBarColor)
        return button
    }()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
}

//MARK: - Actions
extension ParkingLotVC {
    @IBAction func onSelectSegment(_ sender: UISegmentedControl) {
        segmentParkingLot.selectedSegmentIndex = sender.selectedSegmentIndex
        tableViewParkingLot.reloadData()
    }
}

//MARK: - setupView
extension ParkingLotVC {
    private func setupView() {
        
        tableViewParkingLot.delegate = self
        tableViewParkingLot.dataSource = self
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        if navigationController?.viewControllers.contains(self) == true {
            navigationController?.navigationBar.tintColor = .white
        }
        
        view.backgroundColor = UIColor(named: CustomColor.parkingLotNavigationBarColor)
        viewBottom.backgroundColor = .white
        navigationItem.titleView = lblTitle
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(systemName: UIImage.parkingLotMenu), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: UIImage.parkingLotNotifications), style: .plain, target: nil, action: nil)
        
        segmentParkingLot.backgroundColor = UIColor(named: CustomColor.parkingLotSegmentBackground)
        segmentParkingLot.selectedSegmentTintColor = UIColor(named: CustomColor.parkingLotSelectedSegment)
        segmentParkingLot.layer.borderColor = UIColor(named: CustomColor.parkingLotNavigationBarColor)?.cgColor
        segmentParkingLot.layer.borderWidth = 2.0
        segmentParkingLot.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white , NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13.5) ], for: .selected)
        segmentParkingLot.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(named: CustomColor.dimmWhite) ?? .white , NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13.5) ,], for: .normal)
        
        tableViewParkingLot.register(UINib(nibName: AppConstants.parkingLotCellIdentifier, bundle: nil), forCellReuseIdentifier: AppConstants.parkingLotCellIdentifier)
        
        tableViewParkingLot.register(UINib(nibName: AppConstants.parkingLotHeaderCell, bundle: nil), forHeaderFooterViewReuseIdentifier: AppConstants.parkingLotHeaderCell)
        tableViewParkingLot.register(UINib(nibName: AppConstants.parkingLotTimeSheetCell, bundle: nil), forCellReuseIdentifier: AppConstants.parkingLotTimeSheetCell)
        tableViewParkingLot.sectionHeaderTopPadding = 0
        tableViewParkingLot.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
}
//MARK: - UITableViewDataSource
extension ParkingLotVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentParkingLot.selectedSegmentIndex == ParkingLotSegments.timeSheet.rawValue {
            return parkingLotTimeSheets.count
        }
        return parkingLots[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segmentParkingLot.selectedSegmentIndex {
        case ParkingLotSegments.markAttendance.rawValue :
            print(ParkingLotSegments.markAttendance.rawValue)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.parkingLotCellIdentifier, for: indexPath) as? ParkingLotCell else {
                return UITableViewCell()
            }
            
            cell.configureCell(data: parkingLots[indexPath.section].rows[indexPath.row] )
            cell.onClickStartHandler = { [weak self] in
                if ParkingLotModel.canPark {
                    guard let self else {
                        return
                    }
                    self.parkingLots[indexPath.section].rows[indexPath.row].btnStartState = false
                    self.parkingLots[indexPath.section].rows[indexPath.row].btnPauseAndPlayState = true
                    cell.handleStart(data: self.parkingLots[indexPath.section].rows[indexPath.row] )
                    
                    ParkingLotModel.canPark = !ParkingLotModel.canPark
                } else {
                    let alertController = UIAlertController(title:AppConstants.parkingLotCanNotParkTitle , message: AppConstants.parkingLotCanNotParkMessage, preferredStyle: .alert)
                    let btnOk = UIAlertAction(title: AppConstants.parkingLotOKButtonTitle, style: .cancel)
                    alertController.addAction(btnOk)
                    self?.present(alertController,animated: true)
                }
            }
            
            cell.onClickPauseHandler = {
                cell.handlePause()
                ParkingLotModel.canResume = !ParkingLotModel.canResume
            }
            
            cell.onClickStopHandler = { [weak self] in
                guard let self else {
                    return
                }
                self.parkingLots[indexPath.section].rows[indexPath.row].btnPauseAndPlayState = false
                self.parkingLots[indexPath.section].rows[indexPath.row].btnStartState =  true
                cell.handleStop(data: self.parkingLots[indexPath.section].rows[indexPath.row] )
                ParkingLotModel.canPark = !ParkingLotModel.canPark
            }
            
            return cell
            
        case ParkingLotSegments.timeSheet.rawValue :
            print(ParkingLotSegments.markAttendance.rawValue)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.parkingLotTimeSheetCell) as? ParkingLotTimeSheetCell else {
                return UITableViewCell()
            }
            cell.configureCell(data:parkingLotTimeSheets[indexPath.row].parkingLotTimesheetPlaceHolder)
            
            return cell
            
        default:
            break
        }
        return UITableViewCell()
    }
    
}

//MARK: - UITableViewDelegate
extension ParkingLotVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / AppConstants.parkingLotHeightDivider
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.height / AppConstants.parkingLotHeaderHeightDivider
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: AppConstants.parkingLotHeaderCell) as? ParkingLotHeaderCell else {
            return UITableViewHeaderFooterView()
        }
        headerCell.configureHeaderCell(data: parkingLots[section].section)
        return headerCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if segmentParkingLot.selectedSegmentIndex == ParkingLotSegments.timeSheet.rawValue {
            return AppConstants.parkingLotTimeSheetSectionCount
        }
        return parkingLots.count
    }
}

//MARK: - UIGestureRecognizerDelegate
extension ParkingLotVC : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
