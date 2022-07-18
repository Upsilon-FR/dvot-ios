//
//  DirectInfo.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

struct DirectInfo: View {
    @State private var showingInfoModal = false
    
    var body: some View {
        Button {
            showingInfoModal.toggle()
        } label: {
            Text("Comment fonctionnent les directs ?")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(15)
                .background(Color("darkPrimary"))
                .cornerRadius(10)
        }
        .sheet(isPresented: $showingInfoModal) {
            DirectInfoModalView()
        }
    }
}

struct DirectInfo_Previews: PreviewProvider {
    static var previews: some View {
        DirectInfo()
    }
}
