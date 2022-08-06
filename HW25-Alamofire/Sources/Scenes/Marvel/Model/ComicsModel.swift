//
//  ComicsModel.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import Foundation

struct MarvelResponse: Decodable {
    let comics: Comics

    enum CodingKeys: String, CodingKey {
        case comics = "data"
    }
}

struct Comics: Decodable {
    let all: [Comic]

    enum CodingKeys: String, CodingKey {
        case all = "results"
    }
}
