//
//  Model.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 14/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import Foundation

struct ImageList: Codable {
    let query: ImagePages
}

struct ImagePages: Codable {
    let pages: [String: ImageObject]
}

struct ImageObject: Codable, Hashable {
    
    let pageid: Int
    let title: String
    let thumbnail: ImageInfo?
    
    static func == (lhs: ImageObject, rhs: ImageObject) -> Bool {
        return lhs.pageid == rhs.pageid
    }
}

struct ImageInfo: Codable, Hashable {
    let source: String
    let width: Int
    let height: Int
}

