//
//  Request.swift
//  Dvot
//
//  Created by Eduard Serban on 19/07/2022.
//

import SwiftUI

class PersonalRequest: Identifiable {
    let id: String?
    let type: String
    let description: String
    let date: String
    let userId: String
    let status: Bool
    let accepted: Bool?
    let treatedBy: String?
    let teatedDate: String?
    
    init(id: String?, type: String, description: String, date: String, userId: String, status: Bool, accepted: Bool?, treatedBy: String?, teatedDate: String?){
        self.id = id
        self.type = type
        self.description = description
        self.date = date
        self.userId = userId
        self.status = status
        self.accepted = accepted
        self.treatedBy = treatedBy
        self.teatedDate = teatedDate
    }
    
    public class func fromDict(_ dict: [String: Any]) -> PersonalRequest? {
        guard let type = dict["type"] as? String,
              let description = dict["description"] as? String,
              let date = dict["date"] as? String,
              let userId = dict["utilisateurId"] as? String,
              let status = dict["status"] as? Bool
        else {
            return nil
        }
        
        let id = dict["id"] as? String
        let accepted = dict["accepte"] as? Bool
        let treatedBy = dict["traite_par"] as? String
        let tratedDate = dict["date_traitement"] as? String
        
        return PersonalRequest(id: id, type: type, description: description, date: date, userId: userId, status: status, accepted: accepted, treatedBy: treatedBy, teatedDate: tratedDate)
    }
    
    public func toDict() -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["type"] = self.type
        dict["date"] = self.date
        dict["description"] = self.description
        dict["utilisateurId"] = ApiServices.USER!.id!
        return dict
    }
}
