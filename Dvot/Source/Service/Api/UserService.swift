//
//  UserService.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import Foundation

class UserService {
    static let USER_BASE = ApiServices.API_URL + "/ios/utilisateur"
    
    class func get(with mail: String, and token: String, completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: UserService.USER_BASE + "/\(mail)") else {
            completion(ApiServices.API_DEFAULT_RESPONSE)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
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
