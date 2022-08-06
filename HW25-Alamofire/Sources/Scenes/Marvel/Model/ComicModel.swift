//
//  ComicModel.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import Foundation

struct Comic: Decodable {
    private let id: Int?
    private let title: String?
    private let thumbnail: Thumbnail?

    struct Thumbnail: Decodable {
        let path: String
        let thumbnailExtension: String

        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
    }
}
