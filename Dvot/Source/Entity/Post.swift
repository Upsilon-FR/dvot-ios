//
//  Post.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import SwiftUI

class Post: CustomStringConvertible, Identifiable {
    var description: String {
        "Post"
    }
    
    let id: String?
    let title: String
    let desc: String
    let dateCreation: String
    let dateVote: String
    let etat: String
    let lienVideo: [String]?
    let documents: [String]?
    
    init(id: String?, title: String, desc: String, dateCreation: String, dateVote: String, etat: String, lienVideo: [String]?, documents: [String]?){
        self.id = id
        self.title = title
        self.desc = desc
        self.dateCreation = dateCreation
        self.dateVote = dateVote
        self.etat = etat
        self.lienVideo = lienVideo
        self.documents = documents
    }
    
    
    public class func fromDict(_ dict: [String: Any]) -> Post? {
        guard let title = dict["titre"] as? String,
              let desc = dict["description"] as? String,
              let dateCreation = dict["date_creation"] as? String,
              let dateVote = dict["date_vote"] as? String,
              let etat = dict["etat"] as? String else {
                  return nil
              }
        
        let id = dict["id"] as? String
        
        return Post(id: id, title: title, desc: desc, dateCreation: dateCreation, dateVote: dateVote, etat: etat, lienVideo: nil, documents: nil)
    }
    
}
