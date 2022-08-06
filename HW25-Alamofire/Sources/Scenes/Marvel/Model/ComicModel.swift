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

//MARK: - ComicsDisplayable -

extension Comic: ComicDisplayable {

    var titleLabelText: String {
        guard let title = title else {
            return "Comics has no title"
        }
        return title
    }

    var idLabelText: Int {
        guard let id = id else {
            return -1
        }
        return id
    }

    var imageUrl: String {
        guard let thumbnail = thumbnail else {
            return "Comics has image"
        }

        let fullThumbnail = thumbnail.path.components(separatedBy: "//")
        let url = "https://" + fullThumbnail[1] + "." + thumbnail.thumbnailExtension
        return url
    }
}
