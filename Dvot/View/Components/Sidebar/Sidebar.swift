//
//  Sidebar.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct Sidebar: View {
    var page: String
    var body: some View {
        VStack(spacing: 50) {
            UserPreviewSidebar()
                .font(.system(size: 16))
            VStack(alignment: .leading, spacing: 40) {
                SidebarElement(icon: Image(systemName: "house.fill"), label: "Lois", isSelected: "Lois" == page, target: HomePageView())
                SidebarElement(icon: Image(systemName: "magnifyingglass"), label: "Recherche",isSelected: "Recherche" == page,  target: SearchPageView())
                SidebarElement(icon: Image(systemName: "livephoto"), label: "Directs",isSelected: "Directs" == page,  target: DirectsPageView())
                SidebarElement(icon: Image(systemName: "person.2"), label: "Profil", isSelected: "Profil" == page, target: ProfilePageView())
                Spacer()
            }
            .padding(20)
        }
        .padding(.top, 50)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            Sidebar(page: "Lois")
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
