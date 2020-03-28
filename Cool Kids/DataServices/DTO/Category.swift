//
//  Category.swift
//  Cool Kids
//
//  Created by Eslam on 3/26/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import Foundation
//class Results: Codable {
//    var categories: [Category]?
//}
//class Category: Codable {
//    let id: Int?
//    let name: String?
//    let image: String?
//}
struct CategoryE: Codable {
    let id: Int
    let name: String
    let image, largeImage: String?
    let releaseDate: Int?
    let parentID, childrenCount, videosCount, videosViews: Int
    let children: [CategoryE]?

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case largeImage = "large_image"
        case releaseDate = "release_date"
        case parentID = "parent_id"
        case childrenCount, videosCount, videosViews, children
    }
}

typealias Category = [CategoryE]
