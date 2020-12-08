//
//  DetailViewData.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - STRUCT VIEW DATA -
struct DetailViewData {
    var id = -1
    var name = ""
    var urlBanner = ""
    var originElement = LocationElementViewData()
    var locationElement = LocationElementViewData()
    var enableFavorite = false
}

struct LocationElementViewData {
    var titleName = TitleLocation.name
    var valueName = ""
    var titleType = TitleLocation.type
    var valueType = ""
    var titleDimension = TitleLocation.dimension
    var valueDimension = ""
}

extension LocationElementViewData {
    enum TitleLocation: String {
        case name = "Name"
        case type = "Type"
        case dimension = "Dimension"
    }
}
