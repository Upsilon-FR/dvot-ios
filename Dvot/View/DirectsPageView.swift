//
//  DirectsPageView.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct DirectsPageView: View {
    var body: some View {
        HStack(alignment: .top){
            Sidebar(page: "Directs")
                .padding()
                .frame(width: 250)
                .overlay(Divider(), alignment: .trailing)
            DirectsPageContent()
        }
    }
}

struct DirectsPageView_Previews: PreviewProvider {
    static var previews: some View {
        DirectsPageView()
    }
}
