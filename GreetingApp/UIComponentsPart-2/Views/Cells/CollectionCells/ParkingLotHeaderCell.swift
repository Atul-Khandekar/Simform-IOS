//
//  ParkingLotHeaderCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 03/06/23.
//

import UIKit

class ParkingLotHeaderCell: UITableViewHeaderFooterView {

    
    @IBOutlet weak var lblParkingLotTitle: UILabel!
    @IBOutlet weak var lblParkingLotAction: UILabel!
}

extension ParkingLotHeaderCell {
    func configureHeaderCell(data: ParkingLotSection) {
        lblParkingLotTitle.text = data.parkingLotTitle
        lblParkingLotAction.text = data.parkingLotAction
        contentMode = .center
        
    }
}
