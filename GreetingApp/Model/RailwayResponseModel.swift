//
//  RailwayResponseModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//

import Foundation

struct RailwayResponseModel : Codable {

    let active : String?
    let catalogUuid : String?
    let count : Int?
    let created : Int?
    let createdDate : String?
    let desc : String?
    let externalWs : String?
    let externalWsUrl : String?
    let field : [RailwayField]?
    let indexName : String?
    let limit : String?
    let message : String?
    let offset : String?
    let org : [String]?
    let orgType : String?
    let records : [RailwayRecord]?
    let sector : [String]?
    let source : String?
    let status : String?
    let title : String?
    let total : Int?
    let updated : Int?
    let updatedDate : String?
    let version : String?
    let visualizable : String?

    enum CodingKeys: String, CodingKey {
        case active = "active"
        case catalogUuid = "catalog_uuid"
        case count = "count"
        case created = "created"
        case createdDate = "created_date"
        case desc = "desc"
        case externalWs = "external_ws"
        case externalWsUrl = "external_ws_url"
        case field = "field"
        case indexName = "index_name"
        case limit = "limit"
        case message = "message"
        case offset = "offset"
        case org = "org"
        case orgType = "org_type"
        case records = "records"
        case sector = "sector"
        case source = "source"
        case status = "status"
        case title = "title"
        case total = "total"
        case updated = "updated"
        case updatedDate = "updated_date"
        case version = "version"
        case visualizable = "visualizable"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        active = try values.decodeIfPresent(String.self, forKey: .active)
        catalogUuid = try values.decodeIfPresent(String.self, forKey: .catalogUuid)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        created = try values.decodeIfPresent(Int.self, forKey: .created)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        desc = try values.decodeIfPresent(String.self, forKey: .desc)
        externalWs = try values.decodeIfPresent(String.self, forKey: .externalWs)
        externalWsUrl = try values.decodeIfPresent(String.self, forKey: .externalWsUrl)
        field = try values.decodeIfPresent([RailwayField].self, forKey: .field)
        indexName = try values.decodeIfPresent(String.self, forKey: .indexName)
        limit = try values.decodeIfPresent(String.self, forKey: .limit)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        offset = try values.decodeIfPresent(String.self, forKey: .offset)
        org = try values.decodeIfPresent([String].self, forKey: .org)
        orgType = try values.decodeIfPresent(String.self, forKey: .orgType)
        records = try values.decodeIfPresent([RailwayRecord].self, forKey: .records)
        sector = try values.decodeIfPresent([String].self, forKey: .sector)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        updated = try values.decodeIfPresent(Int.self, forKey: .updated)
        updatedDate = try values.decodeIfPresent(String.self, forKey: .updatedDate)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        visualizable = try values.decodeIfPresent(String.self, forKey: .visualizable)
    }

}


struct RailwayRecord : Codable {

    let distance : String?
    let arrivalTime : String?
    let departureTime : String?
    let destinationStation : String?
    let destinationStationName : String?
    let seq : String?
    let sourceStation : String?
    let sourceStationName : String?
    let stationCode : String?
    let stationName : String?
    let trainName : String?
    let trainNo : String?

    enum CodingKeys: String, CodingKey {
        case distance = "_distance"
        case arrivalTime = "arrival_time"
        case departureTime = "departure_time"
        case destinationStation = "destination_station"
        case destinationStationName = "destination_station_name"
        case seq = "seq"
        case sourceStation = "source_station"
        case sourceStationName = "source_station_name"
        case stationCode = "station_code"
        case stationName = "station_name"
        case trainName = "train_name"
        case trainNo = "train_no"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        distance = try values.decodeIfPresent(String.self, forKey: .distance)
        arrivalTime = try values.decodeIfPresent(String.self, forKey: .arrivalTime)
        departureTime = try values.decodeIfPresent(String.self, forKey: .departureTime)
        destinationStation = try values.decodeIfPresent(String.self, forKey: .destinationStation)
        destinationStationName = try values.decodeIfPresent(String.self, forKey: .destinationStationName)
        seq = try values.decodeIfPresent(String.self, forKey: .seq)
        sourceStation = try values.decodeIfPresent(String.self, forKey: .sourceStation)
        sourceStationName = try values.decodeIfPresent(String.self, forKey: .sourceStationName)
        stationCode = try values.decodeIfPresent(String.self, forKey: .stationCode)
        stationName = try values.decodeIfPresent(String.self, forKey: .stationName)
        trainName = try values.decodeIfPresent(String.self, forKey: .trainName)
        trainNo = try values.decodeIfPresent(String.self, forKey: .trainNo)
    }
}

struct RailwayField : Codable {

    let id : String?
    let name : String?
    let type : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
