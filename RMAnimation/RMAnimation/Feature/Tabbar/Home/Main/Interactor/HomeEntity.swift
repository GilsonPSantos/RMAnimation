//
//  HomeEntity.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - STRUCT REQUEST -
struct HomeRequest: Encodable {
    let url: String
}

//MARK: - STRUCT RESPONSE -
struct HomeResponse {
    let pages: Int
    let count: Int
    let nextPage: String
    let isLastPage: Bool
    var characters: [CharacterResponse] = []
    
    init() {
        self.nextPage = ""
        self.isLastPage = false
        self.pages = 0
        self.count = 0
    }
    
    init(pages: Int, count: Int, nextPage: String, isLastPage: Bool) {
        self.pages = pages
        self.count = count
        self.nextPage = nextPage
        self.isLastPage = isLastPage
    }
}

struct CharacterResponse {
    let id: Int
    let name: String
    let creationDate: Date
    let urlImage: String
}
