//
//  PostListElement.swift
//  Dvot
//
//  Created by Eduard Serban on 17/07/2022.
//

import SwiftUI
import NavigationStack

struct PostListElement: View {
    
    let post: Post
    
    private func timePassed() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let today = dateFormatter.string(from: Date())
        let postCreationDate = self.post.dateCreation
        
        let todayArray = today.split(separator: "/")
        let postCreationDateArray = postCreationDate.split(separator: "/")
        
        let currentDay = Int(todayArray[0]) ?? 0
        let currentMonth = Int(todayArray[1]) ?? 0
        let currentYear = Int(todayArray[2]) ?? 0
        
        let postCreationDay = Int(postCreationDateArray[0]) ?? 0
        let postCreationMonth = Int(postCreationDateArray[1]) ?? 0
        let postCreationYear = Int(postCreationDateArray[2]) ?? 0
        
        print(currentYear)
        print(postCreationYear)
        
        if currentYear == postCreationYear {
            if currentMonth == postCreationMonth {
                if currentDay == postCreationDay {
                    return "aujourd'hui"
                }
                return "il y a \(currentDay - postCreationDay) jours"
            }
            return "il y a \(currentMonth - postCreationMonth) mois"
        }
        return "il y a \(currentYear - postCreationYear) ans"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.timePassed())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(15)
            Image("posts-photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .padding(.horizontal, 15)
            Text(post.title)
                .font(.title)
                .foregroundColor(.black)
                .lineLimit(2)
                .padding(15)
            Text(post.description)
                .font(.body)
                .foregroundColor(.black)
                .lineLimit(4)
                .padding(15)
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
            .padding(.horizontal, 15)
            HStack(alignment: .top, spacing: 10) {
                Spacer()
                PushView(destination: PostDetailView(post: post)) {
                    Text("Consulter")
                        .padding()
                        .background(Color("primary"))
                        .font(.title3)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color("softWhite"), radius: 5, x: 0, y: 2)
    }
}

struct PostListElement_Previews: PreviewProvider {
    static var previews: some View {
        PostListElement(post: Post(id: nil, title: "Test Post", desc: "", dateCreation: "", dateVote: "", etat: "", lienVideo: nil, documents: nil))
    }
}
