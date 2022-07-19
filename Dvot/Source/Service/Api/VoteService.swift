//
//  VoteService.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

class VoteService {
    static let VOTE_BASE = ApiServices.API_URL + "/ios/vote"
    
    class func get(with post: String, completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: VOTE_BASE + "/\(post)") else {
            completion(ApiServices.API_DEFAULT_RESPONSE)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("Bearer \(ApiServices.TOKEN)", forHTTPHeaderField: "authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(ApiServices.API_DEFAULT_RESPONSE)
                return
                
            }
            
            
            let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            
            guard let apiResponseDict = json as? [String: Any] else {
                completion(ApiServices.API_DEFAULT_RESPONSE)
                return
            }
            
            guard let apiResponse = ApiResponse.fromDict(apiResponseDict) else {
                completion(ApiServices.API_DEFAULT_RESPONSE)
                return
            }
            
            completion(apiResponse)
        }
        task.resume()
    }
}
