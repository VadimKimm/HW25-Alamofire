//
//  CardModel.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 04.08.2022.
//

import Foundation

struct Card: Decodable {
    private let name: String?
    private let manaCost: String?
    private let type: String?
    private let rarity: String?
    private let setName: String?
    private let artist: String?
    private let power: String?
    private let legalities: [LegalityElement]?
    private let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case name, manaCost, type, rarity, setName, artist, power, legalities
        case imageURL = "imageUrl"
    }

    struct LegalityElement: Decodable {
        let format: String
        let legality: String
    }
}

//MARK: - Displayable -

extension Card: Displayable {
    var cardNameLabelText: String {
        guard let name = name else { return "Error" }
        return name
    }

    var manaCostLabelText: String {
        guard let manaCost = manaCost else { return "Error" }
        return String("Manacost: \(manaCost)")
    }
}

