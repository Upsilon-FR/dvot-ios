//
//  UtilWidgetsHomePage.swift
//  Dvot
//
//  Created by Eduard Serban on 15/07/2022.
//

import SwiftUI
import NavigationStack

struct UtilWidgetsHomePage: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            VoteInfo()
            PushView(destination: ProfilePageView()) {
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
