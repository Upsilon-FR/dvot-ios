//
//  DirectsPageContent.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct DirectsPageContent: View {
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            VStack{
                Text("Directs")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                HStack {
                    DirectsListDirectsPageView()
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    Spacer()
                    UtilWidgetsDirectsPage()
                        .frame(maxWidth: 250, alignment: .topLeading)
                }
            }
            .padding(20)
        }
    }
}

struct DirectsPageContent_Previews: PreviewProvider {
    static var previews: some View {
        DirectsPageContent()
    }
}
