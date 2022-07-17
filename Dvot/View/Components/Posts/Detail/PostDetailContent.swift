//
//  PostDetailContent.swift
//  Dvot
//
//  Created by Eduard Serban on 17/07/2022.
//

import SwiftUI

struct PostDetailContent: View {
    
    var post: Post
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image("posts-photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(10)
                Text(post.title)
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                    Text(post.dateVote)
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer()
                }
                Text("L'essentiel de la loi")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(post.desc)
                    .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Text("Compléments")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Aucun complément pour cette proposition de loi")
                    .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                Text("Ou en est-on ?")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("L'état de la proposition de loi est: \(post.etat)")
                    .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 15)
        }
    }
}
