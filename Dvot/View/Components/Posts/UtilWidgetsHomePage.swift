//
//  UtilWidgetsHomePage.swift
//  Dvot
//
//  Created by Eduard Serban on 15/07/2022.
//

import SwiftUI
import NavigationStack

struct UtilWidgetsHomePage: View {
    
    @State private var showingModal = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            VoteInfo()
            Button {
                showingModal.toggle()
            } label: {
                HStack{
                    Image(systemName: "doc.fill")
                        .font(.body)
                        .foregroundColor(Color("primary"))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    Text("Déposer un nouveau projet")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(15)
                .background(Color("primary"))
                .cornerRadius(10)
                
            }
            .sheet(isPresented: $showingModal) {
                SendRequestModalView(title: "Déposer un nouveau projet", showingModal: $showingModal)
            }
            Spacer()
        }
        .padding()
    }
}

struct UtilWidgetsHomePage_Previews: PreviewProvider {
    static var previews: some View {
        UtilWidgetsHomePage()
    }
}
