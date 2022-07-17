//
//  ReturnButton.swift
//  Dvot
//
//  Created by Eduard Serban on 17/07/2022.
//

import SwiftUI
import NavigationStack

struct ReturnButton: View {
    
    var label: String
    
    var body: some View {
        PopView{
            HStack(spacing: 8){
                Image(systemName: "chevron.backward")
                    .font(.system(size: 16))
                    .foregroundColor(Color("primary"))
                Text(label)
                    .font(.system(size: 16))
                    .foregroundColor(Color("primary"))
                    .fontWeight(.bold)
            }
            
        }
    }
}
