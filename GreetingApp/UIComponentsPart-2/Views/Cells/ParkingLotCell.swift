//
//  parkingLotCellTableViewCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 02/06/23.
//

import UIKit

class ParkingLotCell: UITableViewCell {

    @IBOutlet weak var stackViewPausePlay: UIStackView!
    @IBOutlet weak var lblParkingLotName: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    var onClickStartHandler: (() -> Void)?
    var onClickPauseHandler: (() -> Void)?
    var onClickStopHandler: (() -> Void)?
    
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

extension ParkingLotCell {
    func configureCell(data: ParkingLotData) {
        lblParkingLotName.text = data.parkingLotName
        stackViewPausePlay.isHidden = true
        if data.btnStartState {
            btnStart.isHidden = false
            stackViewPausePlay.isHidden = true
        } else {
            stackViewPausePlay.isHidden = false
            btnStart.isHidden = true
        }
    }
}
