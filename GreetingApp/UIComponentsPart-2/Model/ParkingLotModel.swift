//
//  ParkingLotData.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 02/06/23.
//

import Foundation

struct ParkingLotModel {
 
    let section: ParkingLotSection
    var rows: [ParkingLotData]
    static var canResume = true
    static var canPark = true
    
    static func getParkingLotModel() -> [ParkingLotModel] {
        let data = [
            ParkingLotModel(section: ParkingLotSection(parkingLotTitle: "Parking Lot name ", parkingLotAction: "Action "), rows: [
            
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),
                ParkingLotData(parkingLotName: "Parking Lot 1"),

        
            ])
        ]
        return data
    }
    
    static func getParkingLotTimeSheetData() -> [ParkingLotTimesheetModel] {
        let data = [
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
            ParkingLotTimesheetModel(parkingLotTimesheetPlaceHolder: "Parking Lot place holder "),
        ]
        return data
    }
    
    
}
struct ParkingLotSection {
    var parkingLotTitle: String
    var parkingLotAction: String
}

struct ParkingLotData {
    var parkingLotName: String
    var btnStartState = true
    var btnPauseAndPlayState = false
}

struct ParkingLotTimesheetModel {
    var parkingLotTimesheetPlaceHolder: String
}
