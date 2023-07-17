//
//  parkingLotCellTableViewCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 02/06/23.
//

import UIKit

class ParkingLotCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak private var stackViewPausePlay: UIStackView!
    @IBOutlet weak private var lblParkingLotName: UILabel!
    @IBOutlet weak private var btnStart: UIButton!
    @IBOutlet weak private var btnPause: UIButton!
    
    //MARK: - Variables
    var onClickStartHandler: (() -> Void)?
    var onClickPauseHandler: (() -> Void)?
    var onClickStopHandler: (() -> Void)?
    
}

//MARK: - configureCell
extension ParkingLotCell {
    func configureCell(data: ParkingLotData) {
        lblParkingLotName.text = data.parkingLotName
        stackViewPausePlay.isHidden = true
        btnStart.isHidden = false
        if !data.btnStartState {
            stackViewPausePlay.isHidden = !stackViewPausePlay.isHidden
            btnStart.isHidden = !btnStart.isHidden
            
            btnPause.setImage(UIImage.getImage(ParkingLotModel.canResume ? AppConstants.parkingLotPauseIcon: AppConstants.parkingLotResumeIcon), for: .normal)
        }
    }
}

//MARK: - eventHandlers
extension ParkingLotCell {
    func handleStart(data: ParkingLotData) {
        btnStart.isHidden = !btnStart.isHidden
        stackViewPausePlay.isHidden = !stackViewPausePlay.isHidden
    }
    
    func handlePause() {
        btnPause.setImage(ParkingLotModel.canResume ? UIImage.getImage(AppConstants.parkingLotResumeIcon) : UIImage.getImage(AppConstants.parkingLotPauseIcon), for: .normal)
    }
    
    func handleStop(data: ParkingLotData) {
        stackViewPausePlay.isHidden = !stackViewPausePlay.isHidden
        btnStart.isHidden = !btnStart.isHidden
        
    }
}

//MARK: - Actions
extension ParkingLotCell {
    
    @IBAction func onClickStart(_ sender: UIButton) {
        onClickStartHandler?()
    }
    
    @IBAction func onClickPause(_ sender: UIButton) {
        onClickPauseHandler?()
    }
    
    @IBAction func onClickStop(_ sender: UIButton) {
        onClickStopHandler?()
    }
}
