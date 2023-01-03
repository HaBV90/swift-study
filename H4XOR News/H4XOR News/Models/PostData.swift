//
//  PostData.swift
//  H4XOR News
//
//  Created by HaBV on 12/12/2022.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let title: String
    let url: String?
    let author: String
    let points: Int
    let objectID: String
}
