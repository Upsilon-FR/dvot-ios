//
//  User.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import Foundation

class User: CustomStringConvertible {
    var description: String {
        "User"
    }
    
    let id: String?
    let lastName: String
    let firstName: String
    let mail: String
    let birthDate: String
    let birthPlace: String
    let gender: String
    let role: String
    
    init(id: String?, lastName: String, firstName: String, mail: String, birthDate: String, birthPlace: String, gender: String, role: String){
        self.id = id
        self.lastName = lastName
        self.firstName = firstName
        self.mail = mail
        self.birthDate = birthDate
        self.birthPlace = birthPlace
        self.gender = gender
        self.role = role
    }
    
    public class func fromDict(_ dict: [String: Any]) -> User? {
        guard let lastName = dict["nom"] as? String,
              let fistName = dict["prenom"] as? String,
              let mail = dict["mail"] as? String,
              let birthDate = dict["date_naissance"] as? String,
              let birthPlace = dict["lieu_naissance"] as? String,
              let gender = dict["genre"] as? String,
              let role = dict["role"] as? String else {
                  return nil
              }
        let id = dict["id"] as? String
        
        return User(id: id, lastName: lastName, firstName: fistName, mail: mail, birthDate: birthDate, birthPlace: birthPlace, gender: gender, role: role)
    }
}
