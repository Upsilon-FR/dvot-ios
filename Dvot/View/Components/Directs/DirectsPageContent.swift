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
            Color(.green)
                .ignoresSafeArea()
            Text("Directs")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title)
        }
    }
}

struct DirectsPageContent_Previews: PreviewProvider {
    static var previews: some View {
        DirectsPageContent()
    }
}
