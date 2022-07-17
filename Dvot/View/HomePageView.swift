//
//  SwiftUIView.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var global = GlobalState()
    
    var body: some View {
        HStack(alignment: .top){
            Sidebar(page: "Lois")
                .padding()
                .frame(width: 250)
                .overlay(Divider(), alignment: .trailing)
            HomePageContent()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            HomePageView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
