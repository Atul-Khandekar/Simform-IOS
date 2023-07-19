//
//  ParkingLotHeaderCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 03/06/23.
//

import UIKit

class ParkingLotHeaderCell: UITableViewHeaderFooterView {

    //MARK: - Outlets
    @IBOutlet weak private var lblParkingLotTitle: UILabel!
    @IBOutlet weak private var lblParkingLotAction: UILabel!
}

//MARK: - configureHeaderCell
extension ParkingLotHeaderCell {
    func configureHeaderCell(data: ParkingLotSection) {
        lblParkingLotTitle.text = data.parkingLotTitle
        lblParkingLotAction.text = data.parkingLotAction
        contentMode = .center
    }
}
