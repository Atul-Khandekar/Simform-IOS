//
//  ParkingLotTimeSheetCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 05/06/23.
//

import UIKit

class ParkingLotTimeSheetCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak private var lblParkingLotTimeSheetPlaceHolder: UILabel!
}

//MARK: - configureCell
extension ParkingLotTimeSheetCell  {
    func configureCell(data: String) {
        lblParkingLotTimeSheetPlaceHolder.text = data
    }
}
