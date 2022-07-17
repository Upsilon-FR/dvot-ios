//
//  ApiResponse.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import Foundation

class ApiResponse: CustomStringConvertible {
    var description: String {
        "Api Response"
    }
    let error: Bool
    let message: String
    let data: [Any]
    
    public init(error: Bool, message: String, data: [Any]){
        self.error = error
        self.message = message
        self.data = data
    }
    
    
    public class func fromDict(_ dict: [String: Any]) -> ApiResponse? {
        guard let error = dict["error"] as? Bool,
              let message = dict["message"] as? String,
              let data = dict["data"] as? [Any] else {
                  return nil
              }
        
        return ApiResponse(error: error, message: message, data: data)
        
    }
}
