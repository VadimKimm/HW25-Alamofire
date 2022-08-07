//
//  Cards.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 04.08.2022.
//

import Foundation

//MARK: - Cards -

struct Cards: Decodable {
    let all: [Card]

    enum CodingKeys: String, CodingKey {
        case all = "cards"
    }
}
