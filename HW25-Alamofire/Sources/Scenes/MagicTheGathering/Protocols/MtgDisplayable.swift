//
//  MtgDisplayable.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 04.08.2022.
//

import Foundation

//MARK: - MtgDisplayable -

protocol MtgDisplayable {
    var nameLabelText: String { get }
    var manaCostLabelText: String { get }
    var typeLabelText: String { get }
    var rarityLabelText: String { get }
    var setNameLabelText: String { get }
    var artistLabelText: String { get }
    var powerLabelText: String { get }
    var descriptionLabelText: String { get }
    var legalitieslabelText: String { get }
}
