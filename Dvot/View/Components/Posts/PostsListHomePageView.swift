//
//  PostsListHomePageView.swift
//  Dvot
//
//  Created by Eduard Serban on 17/07/2022.
//

import SwiftUI

struct PostsListHomePageView: View {
    
    @ObservedObject var sourceOfposts = SourceOfPosts()
    @State var nextIndex = 1
    @State var isShowing = false
    
    init() {
        sourceOfposts.getPosts(at: 0)
        UIScrollView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(sourceOfposts.posts.indices, id: \.self) { postIndex in
                    let post = sourceOfposts.posts[postIndex]
                    PostListElement(post: post)
                        .padding(.vertical, 30)
                        .onAppear {
                            if postIndex == sourceOfposts.posts.count - 1 {
                                sourceOfposts.getPosts(at: nextIndex)
                                nextIndex += 1
                            }
                        }
                }
                .listStyle(.automatic)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct PostsListHomePageView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListHomePageView()
    }
}
