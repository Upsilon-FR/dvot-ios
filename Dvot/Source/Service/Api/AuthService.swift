//
//  AuthService.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import SwiftUI

class AuthService {
    
    class func login(with mail: String, and password: String, completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: ApiServices.API_URL + "/auth/connect") else {
            completion(ApiResponse(error: true, message: "An error has occurred", data: []))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dict = ["mail": mail, "mot_de_passe": password, "role": "POLITIQUE"]
        let data = try? JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(ApiResponse(error: true, message: "An error has occured", data: []))
                return
                
            }
            
            let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            
            guard let apiResponseDict = json as? [String: Any] else {
                completion(ApiResponse(error: true, message: "An error has occured", data: []))
                return
            }
            
            guard let apiResponse = ApiResponse.fromDict(apiResponseDict) else {
                completion(ApiResponse(error: true, message: "An error has occurred", data: []))
                return
            }
            
            completion(apiResponse)
        }
        task.resume()
    }
    
    class func logout(completion: @escaping (ApiResponse) -> Void) {
        guard let url = URL(string: ApiServices.API_URL + "/auth/disconnect") else {
            completion(ApiResponse(error: true, message: "An error has occurred", data: []))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(ApiServices.TOKEN)", forHTTPHeaderField: "authorization")
        
        guard let user = ApiServices.USER else {
            completion(ApiServices.API_DEFAULT_RESPONSE)
            return
        }
        
        let dict = ["mail": user.mail, "role": "POLITIQUE"]
        let data = try? JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(ApiResponse(error: true, message: "An error has occured", data: []))
                return
                
            }
            
            let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            
            guard let apiResponseDict = json as? [String: Any] else {
                completion(ApiResponse(error: true, message: "An error has occured", data: []))
                return
            }
            
            guard let apiResponse = ApiResponse.fromDict(apiResponseDict) else {
                completion(ApiResponse(error: true, message: "An error has occurred", data: []))
                return
            }
            
            completion(apiResponse)
        }
        task.resume()
    }
    
}
