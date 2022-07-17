//
//  ContentView.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import SwiftUI
import NavigationStack

struct ContentView: View {
    
    var body: some View {
        NavigationStackView(transitionType: .custom(AnyTransition.identity)) {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
