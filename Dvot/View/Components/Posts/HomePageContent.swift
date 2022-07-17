//
//  HomePageContent.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct HomePageContent: View {
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack{
                Text("Lois")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                HStack {
                    PostsListHomePageView()
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    Spacer()
                    UtilWidgetsHomePage()
                        .frame(maxWidth: 250, alignment: .topLeading)
                }
            }
            .padding(20)
        }
        
    }
}

struct HomePageContent_Previews: PreviewProvider {
    static var previews: some View {
        HomePageContent()
    }
}
