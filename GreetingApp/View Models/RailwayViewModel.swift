//
//  RailwayViewModel.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 06/07/23.
//
import Alamofire
import Foundation

class RailwayViewModel {
    
    var railwayResponseData = Dynamic<RailwayResponseModel>(nil)
    var liveRailwayRecords = Dynamic<[RailwayRecord]>([])
    
    func getRailwayTimeTable(offset: Int) {
        
        AF.request(RailwayRequestType.railwayTimeTable(offset).targetUrl, method: .get).responseData { responseData in
            
            switch responseData.result {
            case.success(let data):
                do {
                    let decoder = JSONDecoder()
                    let railwayResponse = try decoder.decode(RailwayResponseModel.self, from: data)
                    DispatchQueue.main.async { [weak self] in
                        self?.railwayResponseData.value = railwayResponse
                        self?.liveRailwayRecords.value?.append(contentsOf: railwayResponse.records ?? [])
                    }
                } catch {
                    print(error)
                }
                
            case.failure(let error):
                print(error)
            }
            
        }
    }
}
