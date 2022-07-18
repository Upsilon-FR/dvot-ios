//
//  DirectInfoModalView.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

struct DirectInfoModalView: View {
    var body: some View {
        ZStack {
            Color("primary")
            VStack(alignment: .leading, spacing: 20) {
                Text("Comment fonctionnent les directs?")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding()
        }
    }
}
