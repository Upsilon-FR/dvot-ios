//
//  SavesPageView.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct SearchPageView: View {
    var body: some View {
        HStack(alignment: .top){
            Sidebar(page: "Recherche")
                .padding()
                .frame(width: 250)
                .overlay(Divider(), alignment: .trailing)
            SavesPageContent()
        }
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
