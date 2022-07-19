//
//  RequestService.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

class RequestService {
    static let BASE = ApiServices.API_URL + "/ios/demande"
 
    class func list(at offset: Int, completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: self.BASE + "/list/\(ApiServices.USER?.id ?? "")/15/\(offset)") else {
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
    
    class func send(adminRequest: PersonalRequest, completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: self.BASE + "/send") else {
            completion(ApiServices.API_DEFAULT_RESPONSE)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(ApiServices.TOKEN)", forHTTPHeaderField: "authorization")
        
        let dict = adminRequest.toDict()
        let body = try? JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)
        request.httpBody = body
        
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
