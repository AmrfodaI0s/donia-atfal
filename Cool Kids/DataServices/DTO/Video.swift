//
//  Video.swift
//  Cool Kids
//
//  Created by Eslam on 4/1/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import Foundation

// MARK: - VideoElement
struct Video: Codable {
    let id: Int
    let name: String
    let categoryID: Int
    let videoDescription: String
    let link: String
    let views: Int
    let images: [Image]?
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case id, name
        case categoryID = "category_id"
        case videoDescription = "description"
        case link, views, images, urls
    }
}

// MARK: - Image
struct Image: Codable {
    let image: String?
}

// MARK: - URLElement
struct URLElement: Codable {
    let id, videoID: Int
    let url: String
    let type: TypeEnum
    let quality: Quality
    let qualityLabel: QualityLabel
    let duration: String
    let active: Int
    let createdAt, updatedAt: String
    let deletedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case videoID = "video_id"
        case url, type, quality
        case qualityLabel = "quality_label"
        case duration, active
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}

enum Quality: String, Codable {
    case hd720 = "hd720"
    case medium = "medium"
}

enum QualityLabel: String, Codable {
    case the360P = "360p"
    case the720P = "720p"
}

enum TypeEnum: String, Codable {
    case mp4 = "mp4"
}

typealias Videos = [Video]

// MARK: - Encode/decode helpers

class JSONNull: Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
