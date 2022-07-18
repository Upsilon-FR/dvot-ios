//
//  DetailSideWidgets.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

struct DetailSideWidgets: View {
    var post: Post
    
    @State private var votesFor: Int = 0
    @State private var votesAgainst: Int = 0
    
    let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            VoteInfo()
            HStack{
                Image(systemName: "chart.pie")
                    .font(.body)
                    .foregroundColor(Color("primary"))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                VStack(spacing: 5) {
                    Text("OUI - \(votesFor)")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("NON - \(votesAgainst)")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(15)
            .background(Color("primary"))
            .cornerRadius(10)
            .onAppear {
                let votes = VotesProvider.getEntriesForVotes(from: post)
                votesFor = votes.votesFor
                votesAgainst = votes.votesAgainst
            }
            .onReceive(timer) { _ in
                let votes = VotesProvider.getEntriesForVotes(from: post)
                votesFor = votes.votesFor
                votesAgainst = votes.votesAgainst
            }
            
            Spacer()
        }
        .padding()
    }
}
