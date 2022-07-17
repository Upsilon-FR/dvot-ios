//
//  SplashScreenView.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
        @State private var size = 0.8
        @State private var opacity = 0.5
    @State var color = Color("primary")
        
        // Customise your SplashScreen here
        var body: some View {
            if isActive {
                ContentView()
            } else {
                VStack {
                    Image("dvot-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.size = 0.9
                                self.opacity = 1.00
                                self.color = Color(.white)
                            }
                        }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            SplashScreenView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
