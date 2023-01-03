//
//  WebView.swift
//  H4XOR News
//
//  Created by HaBV on 13/12/2022.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let url: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = url {
            if let url = URL(string: safeURL)  {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
