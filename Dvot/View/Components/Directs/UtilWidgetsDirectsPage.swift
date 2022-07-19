//
//  UtilWidgetsDirectsPage.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI
import NavigationStack

struct UtilWidgetsDirectsPage: View {
    
    @State private var showingModal = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            DirectInfo()
            PushView(destination: ProfilePageView()) {
                HStack{
                    Image(systemName: "doc.fill")
                        .font(.body)
                        .foregroundColor(Color("primary"))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    Text("Faire une demande de direct")
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
                SendRequestModalView(title: "Faire une demande de direct")
            }
            Spacer()
        }
        .padding()
    }
}

struct UtilWidgetsDirectsPage_Previews: PreviewProvider {
    static var previews: some View {
        UtilWidgetsDirectsPage()
    }
}
