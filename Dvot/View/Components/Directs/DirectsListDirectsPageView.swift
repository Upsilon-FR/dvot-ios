//
//  DirectsListDirectsPageView.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

struct DirectsListDirectsPageView: View {
    @ObservedObject var sourceOfDirects = SourceOfDirects()
    @State var nextIndex = 1
    @State var isShowing = false
    
    init() {
        sourceOfDirects.getUpcoming(at: 0)
        sourceOfDirects.getPersonalDirects()
        sourceOfDirects.getLatestLiveDirect()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Vos directs")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                LazyVStack {
                    if sourceOfDirects.personalDirects.isEmpty {
                        Text("Aucun Direct")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.vertical, 30)
                    }
                    ForEach(sourceOfDirects.personalDirects.indices, id: \.self) { index in
                        let direct = sourceOfDirects.personalDirects[index]
                        DiretsListElementMinimalist(direct: direct)
                            .padding(.vertical, 5)
                    }
                }
                .listStyle(.automatic)
                .padding(.horizontal, 20)
                Text("Direct en cours")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                LazyVStack {
                    if sourceOfDirects.latestLiveDirects.isEmpty {
                        Text("Aucun Direct")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.vertical, 30)
                    }
                    ForEach(sourceOfDirects.latestLiveDirects.indices, id: \.self) { index in
                        let direct = sourceOfDirects.latestLiveDirects[index]
                        DirectsListElement(direct: direct)
                            .padding(.vertical, 30)
                    }
                }
                .listStyle(.automatic)
                .padding(.horizontal, 20)
                Text("Prochains directs")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                LazyVStack{
                    if sourceOfDirects.upcomingDirects.isEmpty {
                        Text("Aucun Direct")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.vertical, 30)
                    }
                    ForEach(sourceOfDirects.upcomingDirects.indices, id: \.self) { index in
                        let direct = sourceOfDirects.upcomingDirects[index]
                        DiretsListElementMinimalist(direct: direct)
                            .padding(.vertical, 5)
                            .onAppear {
                                if !sourceOfDirects.upcomingDirects.isEmpty {
                                    if index == sourceOfDirects.upcomingDirects.count - 1 {
                                        sourceOfDirects.getUpcoming(at: nextIndex)
                                        nextIndex += 1
                                    }
                                }
                            }
                    }
                }
                .listStyle(.automatic)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct DirectsListDirectsPageView_Previews: PreviewProvider {
    static var previews: some View {
        DirectsListDirectsPageView()
    }
}
