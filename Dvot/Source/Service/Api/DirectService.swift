//
//  DirectService.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

class DirectService {
    static let BASE = ApiServices.API_URL + "/ios/direct"

    class func list(by mail: String, completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: DirectService.BASE + "/list/\(mail)/3") else {
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
    
    class func list(without mail: String, at offset:Int, completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: DirectService.BASE + "/list/\(mail)/3/\(offset)") else {
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
    
    class func latestLive(completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: DirectService.BASE + "/latest/live") else {
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
    
    class func spectators(of direct: Direct, completion: @escaping (ApiResponse) -> Void) {
        guard let id = direct.id else {
            completion(ApiServices.API_DEFAULT_RESPONSE)
            return
        }
        guard let url = URL(string: DirectService.BASE + "/spectators/\(id)") else {
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
