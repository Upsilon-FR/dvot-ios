//
//  PostDetailView.swift
//  Dvot
//
//  Created by Eduard Serban on 17/07/2022.
//

import SwiftUI
import NavigationStack

struct PostDetailView: View {
    
    var post: Post
    
    var body: some View {
        HStack(alignment: .top){
            Sidebar(page: "Lois")
                .padding()
                .frame(width: 250)
                .overlay(Divider(), alignment: .trailing)
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    ReturnButton(label: "Accueil")
                    HStack {
                        PostDetailContent(post: post)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        Spacer()
                        DetailSideWidgets(post: post)
                            .frame(maxWidth: 250, alignment: .topLeading)
                    }
                }
                .padding(20)
            }
        }
    }
}
