//
//  DirectsListElement.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI
import AVKit

struct DirectsListElement: View {
    var direct: Direct
    
    @State private var spectators: Int = 0
    
    let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    
    private func getYoutubeId(from link: String) -> String {
        let stringArray = link.split(separator: "/")
        let id = String(stringArray[2])
        return id
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VideoView(videoId: getYoutubeId(from: direct.link))
                .frame(height: 400)
                .background(Color.black)
                .cornerRadius(10)
            Text(direct.title)
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(15)
            HStack{
                Text(direct.date)
                    .font(.body)
                    .foregroundColor(.black)
                Spacer()
                HStack {
                    Image(systemName: "eye")
                        .foregroundColor(Color("primary"))
                        .font(.body)
                    Text("\(spectators)")
                }
            }
            .padding(15)
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color("softWhite"), radius: 5, x: 0, y: 2)
        .onAppear {
            DirectService.spectators(of: direct, completion: { response in
                if response.error {
                    return
                }
                
                guard let data = response.data as? [[String: Any]],
                      let nbSpectateurs = data[0]["spectateurs"] as? Int
                 else {
                    return
                }
                spectators = nbSpectateurs
            })
        }
        .onReceive(timer) { _ in
            DirectService.spectators(of: direct, completion: { response in
                if response.error {
                    return
                }
                
                guard let data = response.data as? [[String: Any]],
                      let nbSpectateurs = data[0]["spectateurs"] as? Int
                 else {
                    return
                }
                spectators = nbSpectateurs
            })
        }
    }
}
