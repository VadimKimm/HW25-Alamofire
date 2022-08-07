//
//  ComicModel.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import Foundation

// MARK: - Comic -

struct Comic: Decodable {
    private let id: Int?
    private let title: String?
    private let thumbnail: Thumbnail?
    private let description: String?
    private let creators: Creators?
}

// MARK: - Creators -

struct Creators: Decodable {
    let all: [Creator]

    enum CodingKeys: String, CodingKey {
        case all = "items"
    }

    struct Creator: Decodable {
        let role: String
        let name: String
    }
}

// MARK: - Thumbnail -

struct Thumbnail: Decodable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

//MARK: - ComicsDisplayable -

extension Comic: ComicDisplayable {

    var titleLabelText: String {
        guard let title = title else {
            return "Comic has no title"
        }
        return title
    }

    var idLabelText: String {
        guard let id = id else {
            return "Comic has no id"
        }
        return "Comic id: \(id)"
    }

    var imageUrl: String {
        guard let thumbnail = thumbnail else {
            return "Comic has image"
        }

        let imageSize = "portrait_uncanny"
        let fullThumbnail = thumbnail.path.components(separatedBy: "//")
        let url = "https://" + fullThumbnail[1] + "/\(imageSize)." + thumbnail.thumbnailExtension
        return url
    }

    var creatorsLabelText: String {
        guard let creators = creators?.all, creators.isEmpty == false else {
            return "Comic has no creators"
        }

        var outputText = "Creators:"
        for creator in creators {
            outputText += "\n    \(creator.role): \(creator.name)"
        }

        return outputText
    }

    var descriptionLabelText: String {
        guard let description = description, description != "" else {
            return "Comic has no description"
        }
        return description
    }
}
