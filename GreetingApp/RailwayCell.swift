//
//  RailwayCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import UIKit

class RailwayCell: UITableViewCell {

    @IBOutlet weak var lblTrainNo: UILabel!
    
    @IBOutlet weak var lblTrainName: UILabel!
    
    @IBOutlet weak var lblTrainSource: UILabel!
    
    @IBOutlet weak var lblTrainDestination: UILabel!
 
    @IBOutlet weak var lblTrainSourceCode: UILabel!
    
    @IBOutlet weak var lblTrainDestinationCode: UILabel!
    
    @IBOutlet weak var lblTrainCurrentStation: UILabel!
}

//MARK: - configureCell
extension RailwayCell {

    func configureCell(data: RailwayRecord) {
        
        lblTrainNo.text = data.trainNo
        lblTrainName.text = data.trainName
        lblTrainSource.text = data.sourceStationName
        lblTrainSourceCode.text = data.sourceStation
        lblTrainDestination.text = data.destinationStationName
        lblTrainDestinationCode.text = data.destinationStation
        lblTrainCurrentStation.text = data.stationName
    }
}
