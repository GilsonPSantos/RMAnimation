//
//  DetailEntity.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - STRUCT REQUEST -
struct DetailRequest: Encodable {
    let url: String
}

//MARK: - STRUCT RESPONSE -
struct DetailResponse {
    var id = -1
    var name = ""
    var urlImage = ""
    var urlOrigin = ""
    var urlLocation = ""
    var origin = LocationResponse()
    var location = LocationResponse()
    var isFavorite = false
}

struct LocationResponse {
    var id = -1
    var name = ""
    var type = ""
    var dimension = ""
    
}
