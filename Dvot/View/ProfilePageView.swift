//
//  ProfilePageView.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct ProfilePageView: View {
    var body: some View {
        HStack(alignment: .top){
            Sidebar(page: "Profil")
                .padding()
                .frame(width: 250)
                .overlay(Divider(), alignment: .trailing)
            ProfilePageContent()
        }
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
