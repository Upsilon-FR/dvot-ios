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
        VoteService.get(with: post.id ?? "") { response in
            if response.error {
                return
            }
            guard let data = response.data as? [[String: Any]] else {
                return
            }
            let votes = data[0]
            guard let votesFor = votes["votesFor"] as? Int,
                  let votesAgainst = votes["votesAgainst"] as? Int else {
                      return
                  }
            vote =  VotesProvider(votesFor: votesFor, votesAgainst: votesAgainst)
        }
        return vote
    }
    
}
