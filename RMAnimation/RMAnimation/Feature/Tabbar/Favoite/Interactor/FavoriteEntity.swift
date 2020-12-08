//
//  FavoriteEntity.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - STRUCT REQUEST -
struct FavoriteRequest: Encodable {
    let id: Int
    let name: String
    let creationDate: String
    let imageUrl: String
    let urlDetail: String
}

//MARK: - STRUCT RESPONSE -
struct FavoriteResponse {
    
}
