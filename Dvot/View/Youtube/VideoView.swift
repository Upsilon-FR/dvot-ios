//
//  VideoView.swift
//  Dvot
//
//  Created by Eduard Serban on 18/07/2022.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    
    let videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://youtube.com/embed/\(videoId)") else {
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
