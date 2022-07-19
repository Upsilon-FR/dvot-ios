//
//  SourceOfRequests.swift
//  Dvot
//
//  Created by Eduard Serban on 19/07/2022.
//

import SwiftUI

class SourceOfRequests: ObservableObject {
    
    @Published var requests = [PersonalRequest]()
    
    func getRequests(at index: Int) {
        print("gettin \(index)")
        RequestService.list(at: index) { apiResponse in
            if apiResponse.error {
                return
            }
            
            guard let data = apiResponse.data as? [[String: Any]] else {
                return
            }
            
            DispatchQueue.main.async {
                self.requests.append(contentsOf: data.compactMap(PersonalRequest.fromDict(_:)))
            }
        }
    }
}
