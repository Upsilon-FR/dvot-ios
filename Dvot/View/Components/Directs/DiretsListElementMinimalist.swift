//
//  DiretsListElementMinimalist.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI

struct DiretsListElementMinimalist: View {
    var direct: Direct
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(systemName: "play.circle")
                    .foregroundColor(Color("primary"))
                    .font(.title3)
                Text(direct.title)
                    .font(.title3)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Spacer()
            }
            Text(direct.date)
                .font(.body)
                .foregroundColor(.black)
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color("softWhite"), radius: 5, x: 0, y: 2)
    }
}
