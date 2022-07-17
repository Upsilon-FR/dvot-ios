//
//  SourceOfPosts.swift
//  Dvot
//
//  Created by Eduard Serban on 17/07/2022.
//

import SwiftUI

class SourceOfPosts: ObservableObject {
    
    @Published var posts = [Post]()
    
    func getPosts(at index: Int) {
        print("getting \(index)")
        PostService.list(offset: index) { apiResponse in
            if apiResponse.error {
                return
            }
            
            guard let data = apiResponse.data as? [[String: Any]] else {
                return
            }
            DispatchQueue.main.async {
                self.posts.append(contentsOf: data.compactMap(Post.fromDict(_:)))
            }
        }
    }
    
    func refreshPosts() {
        print("refreshing posts")
        self.posts = [Post]()
        PostService.list(offset: 0) { apiResponse in
            if apiResponse.error {
                return
            }
            
            guard let data = apiResponse.data as? [[String: Any]] else {
                return
            }
            DispatchQueue.main.async {
                self.posts.append(contentsOf: data.compactMap(Post.fromDict(_:)))
            }
        }
    }
}
