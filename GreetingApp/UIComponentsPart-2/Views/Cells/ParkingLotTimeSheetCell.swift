//
//  ParkingLotTimeSheetCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 05/06/23.
//

import UIKit

class ParkingLotTimeSheetCell: UITableViewCell {

    @IBOutlet weak var lblParkingLotTimeSheetPlaceHolder: UILabel!
}

extension ParkingLotTimeSheetCell  {
    func configureCell(data: String) {
        lblParkingLotTimeSheetPlaceHolder.text = data
    }
}
