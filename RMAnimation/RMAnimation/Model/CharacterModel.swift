//
//  CharacterModel.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation

struct CharacterModel: Decodable {
    let info: InfoModel?
    let results: [ResultsModel]?
}

struct InfoModel: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct ResultsModel: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: AttributeModel?
    let location: AttributeModel?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct AttributeModel: Decodable {
    let name: String?
    let url: String?
}
