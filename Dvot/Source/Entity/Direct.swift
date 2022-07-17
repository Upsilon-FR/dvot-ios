//
//  Direct.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import Foundation

class Direct: CustomStringConvertible {
    var description: String {
        "Direct"
    }
    
    let id: String?
    let title: String
    let desc: String
    let link: String
    let date: String
    let author: String
    let live: Bool
    let spectators: Int
    
    init(id: String?, title: String, desc: String, link: String, date: String, author: String, live: Bool, spectators: Int){
        self.id = id
        self.title = title
        self.desc = desc
        self.link = link
        self.date = date
        self.author = author
        self.live = live
        self.spectators = spectators
    }
    
    public class func fromDict(_ dict: [String: Any]) -> Direct? {
        guard let title = dict["titre"] as? String,
              let desc = dict["description"] as? String,
              let link = dict["lien"] as? String,
              let date = dict["date"] as? String,
              let author = dict["auteur"] as? String,
              let live = dict["live"] as? Bool,
              let spectators = dict["spectateurs"] as? Int else {
                  return nil
              }
        
        let id = dict["id"] as? String
        
        return Direct(id: id, title: title, desc: desc, link: link, date: date, author: author, live: live, spectators: spectators)
    }
}
