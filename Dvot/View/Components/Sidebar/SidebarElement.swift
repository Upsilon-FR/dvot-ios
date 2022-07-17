//
//  SidebarElement.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI
import NavigationStack

struct SidebarElement<Content: View>: View {
    var icon: Image
    var label: String
    var isSelected: Bool = false
    var target: Content
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    var body: some View {
        Button {
            self.navigationStack.push(target)
        } label: {
            HStack(alignment: .top, spacing: 20) {
                icon
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? Color("primary") : .secondary)
                Text(label)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? Color("primary") : .secondary)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
            .frame(height: 20)
        }

        
    }
}

struct SidebarElement_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            SidebarElement(icon: Image(systemName: "house.fill"),label: "Lois", target: HomePageView())
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
