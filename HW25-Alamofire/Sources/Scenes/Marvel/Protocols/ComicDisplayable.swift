//
//  ComicDisplayable.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import Foundation

protocol ComicDisplayable {
    var titleLabelText: String { get }
    var idLabelText: Int { get }
    var imageUrl: String { get }
}
