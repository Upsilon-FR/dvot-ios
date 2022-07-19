//
//  VotePieChartElement.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import Foundation
import Charts

struct VotesProvider {
    var votesFor: Int
    var votesAgainst: Int
    
    static func getEntriesForVotes(from post: Post) -> VotesProvider {
        var vote: VotesProvider = VotesProvider(votesFor: 0, votesAgainst: 0)
        
        return vote
    }
    
}
