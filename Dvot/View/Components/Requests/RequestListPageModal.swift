//
//  RequestListPageContent.swift
//  Dvot
//
//  Created by Eduard Serban on 19/07/2022.
//

import SwiftUI

struct RequestListPageModal: View {
    
    @ObservedObject var sourceOfRequests = SourceOfRequests()
    @State var nextIndex = 1
    
    
    init() {
        sourceOfRequests.getRequests(at: 0)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(sourceOfRequests.requests.indices, id: \.self) { index in
                    let request: PersonalRequest = sourceOfRequests.requests[index]
                    HStack {
                        Text(request.type)
                            .font(.title3)
                            .foregroundColor(.white)
                        Spacer()
                        if request.status {
                            if request.accepted! {
                                Text("Traité le " + request.teatedDate!)
                                    .font(.title3)
                                    .foregroundColor(.green)
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            }
                            if !request.accepted! {
                                Text("Traité le " + request.teatedDate!)
                                    .font(.title3)
                                    .foregroundColor(.red)
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.title3)
                            }
                        } else {
                            Text("En attente de traitement")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color("primary"))
                    .cornerRadius(10)
                    .shadow(color: Color("softWhite"), radius: 5, x: 0, y: 2)
                    .padding(.vertical, 30)
                    .onAppear {
                        if index == sourceOfRequests.requests.count - 1 {
                            sourceOfRequests.getRequests(at: nextIndex)
                            nextIndex += 1
                        }
                    }
                }
                .listStyle(.automatic)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct RequestListPageContent_Previews: PreviewProvider {
    static var previews: some View {
        RequestListPageModal()
    }
}
