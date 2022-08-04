//
//  CardModel.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 04.08.2022.
//

import Foundation

struct Cards: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let name: String?
    let manaCost: String?
    let type: String?
    let rarity: String?
    let setName: String?
    let artist: String?
    let power: String?
    let legalities: [LegalityElement]?

    struct LegalityElement: Decodable {
        let format: TypeOfFormat
        let legality: TypeOfLegality
    }

    enum TypeOfFormat: String, Decodable {
        case commander = "Commander"
        case duel = "Duel"
        case explorer = "Explorer"
        case gladiator = "Gladiator"
        case historic = "Historic"
        case historicbrawl = "Historicbrawl"
        case legacy = "Legacy"
        case modern = "Modern"
        case oldschool = "Oldschool"
        case pauper = "Pauper"
        case paupercommander = "Paupercommander"
        case penny = "Penny"
        case pioneer = "Pioneer"
        case premodern = "Premodern"
        case vintage = "Vintage"
    }

    enum TypeOfLegality: String, Decodable {
        case banned = "Banned"
        case legal = "Legal"
        case restricted = "Restricted"
    }
}

