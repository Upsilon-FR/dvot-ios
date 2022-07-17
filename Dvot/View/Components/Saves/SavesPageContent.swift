//
//  SavesPageContent.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct SavesPageContent: View {
    var body: some View {
        ZStack{
            Color(.yellow)
                .ignoresSafeArea()
            Text("Mes projets")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title)
        }
    }
}

struct SavesPageContent_Previews: PreviewProvider {
    static var previews: some View {
        SavesPageContent()
    }
}
