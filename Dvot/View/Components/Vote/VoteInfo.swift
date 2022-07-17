//
//  VoteInfo.swift
//  Dvot
//
//  Created by Eduard Serban on 17/07/2022.
//

import SwiftUI

struct VoteInfo: View {
    @State private var showingInfoModal = false
    
    var body: some View {
        Button {
            showingInfoModal.toggle()
        } label: {
            Text("Comment fonctionne le système de vote ?")
                .font(.body)
                .fontWeight(.bold)
                .lineLimit(2)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(15)
                .background(Color("darkPrimary"))
                .cornerRadius(10)
        }
        .sheet(isPresented: $showingInfoModal) {
            InfoModalView()
        }
    }
}

struct VoteInfo_Previews: PreviewProvider {
    static var previews: some View {
        VoteInfo()
    }
}
