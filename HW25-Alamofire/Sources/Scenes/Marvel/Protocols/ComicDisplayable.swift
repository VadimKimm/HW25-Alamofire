//
//  ComicDisplayable.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import Foundation

protocol ComicDisplayable {
    var titleLabelText: String { get }
    var idLabelText: String { get }
    var imageUrl: String { get }
    var creatorsLabelText: String { get }
    var descriptionLabelText: String { get }
}
