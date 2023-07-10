//
//  RailwayCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import UIKit

class RailwayCell: UITableViewCell {

    @IBOutlet weak private var lblTrainNo: UILabel!
    @IBOutlet weak private var lblTrainName: UILabel!
    @IBOutlet weak private var lblTrainSource: UILabel!
    @IBOutlet weak private var lblTrainDestination: UILabel!
    @IBOutlet weak private var lblTrainSourceCode: UILabel!
    @IBOutlet weak private var lblTrainDestinationCode: UILabel!
    @IBOutlet weak private var lblTrainCurrentStation: UILabel!
    @IBOutlet weak private var lblTrainArrivalTime: UILabel!
    @IBOutlet weak private var lblTrainDepartureTime: UILabel!
    @IBOutlet weak private var lblTrainDistance: UILabel!
    
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
        lblTrainArrivalTime.text = data.arrivalTime
        lblTrainDepartureTime.text = data.departureTime
        lblTrainDistance.text = data.distance
    }
}
