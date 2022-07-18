//
//  SourceOfDirects.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

class SourceOfDirects: ObservableObject {
    @Published var latestLiveDirects = [Direct]()
    @Published var personalDirects = [Direct]()
    @Published var upcomingDirects = [Direct]()
    
    func getUpcoming(at index: Int) {
        print("getting \(index)")
        DirectService.list(without: ApiServices.USER?.mail ?? "", at: index) { apiResponse in
            if apiResponse.error{
                return
            }
            
            guard let data = apiResponse.data as? [[String: Any]] else {
                return
            }
            
            DispatchQueue.main.async {
                self.upcomingDirects.append(contentsOf: data.compactMap(Direct.fromDict(_:)))
            }
        }
    }
    
    func getPersonalDirects(){
        DirectService.list(by: ApiServices.USER?.mail ?? "") { apiResponse in
            if apiResponse.error{
                return
            }
            
            guard let data = apiResponse.data as? [[String: Any]] else {
                return
            }
            
            DispatchQueue.main.async {
                self.personalDirects.append(contentsOf: data.compactMap(Direct.fromDict(_:)))
            }
        }
    }
    
    func getLatestLiveDirect(){
        DirectService.latestLive { apiResponse in
            if apiResponse.error{
                return
            }
            
            guard let data = apiResponse.data as? [[String: Any]] else {
                return
            }
            
            DispatchQueue.main.async {
                self.latestLiveDirects.append(contentsOf: data.compactMap(Direct.fromDict(_:)))
            }
        }
    }
}
