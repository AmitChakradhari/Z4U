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

struct ImageObject: Codable {
    let pageid: Int
    let title: String
    let thumbnail: ImageInfo?
}

struct ImageInfo: Codable {
    let source: String
    let width: Int
    let height: Int
}
