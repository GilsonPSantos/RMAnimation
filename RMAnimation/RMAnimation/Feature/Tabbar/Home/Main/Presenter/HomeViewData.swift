//
//  HomeViewData.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - STRUCT VIEW DATA -
struct HomeViewData {
    var isFinish = false
    var nextPage = ""
    var characters = [CharacterViewData]()
    var isPaginator = false
}

struct CharacterViewData {
    let id: Int
    let name: String
    let creationDate: String
    let imageUrl: String
    let urlDetail: String
}
