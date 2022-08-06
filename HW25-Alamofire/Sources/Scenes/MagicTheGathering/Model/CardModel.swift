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
    private let description: String?

    enum CodingKeys: String, CodingKey {
        case name, manaCost, type, rarity, setName, artist, power, legalities
        case imageURL = "imageUrl"
        case description = "text"
    }

    struct LegalityElement: Decodable {
        let format: String
        let legality: String
    }
}

//MARK: - Displayable -

extension Card: MtgDisplayable {
    var nameLabelText: String {
        guard let name = name else {
            return "Name: Card has no name"
        }
        return name
    }

    var typeLabelText: String {
        guard let type = type else {
            return "Type: Card has no type"
        }
        return String("Type: \(type)")
    }

    var descriptionLabelText: String {
        guard let description = description else {
            return "Card has no description"
        }
        return description
    }

    var rarityLabelText: String {
        guard let rarity = rarity else {
            return "Rarity: Card has no rarity"
        }
        return String("Rarity: \(rarity)")
    }

    var setNameLabelText: String {
        guard let setName = setName else {
            return "Setname: Card has no setname"
        }
        return String("Setname: \(setName)")
    }

    var artistLabelText: String {
        guard let artist = artist else {
            return "Artist: Card has no artist"
        }
        return String("Artist: \(artist)")
    }

    var powerLabelText: String {
        guard let power = power else {
            return "Power: Card has no power"
        }
        return String("Power: \(power)")
    }

    var manaCostLabelText: String {
        guard let manaCost = manaCost else {
            return "Manacost: Card has no manacost"
        }
        return String("Manacost: \(manaCost)")
    }

    var legalitieslabelText: String {
        guard let legalities = legalities else {
            return "Legalities: Card has no legalities"
        }

        var output = "Legalities:\n"
        for (index,item) in legalities.enumerated() {
            output += "   \(index + 1)) Format: \(item.format). Legality: \(item.legality)\n"
        }

        return output
    }
}
