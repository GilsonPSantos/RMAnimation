//
//  LocationModel.swift
//  RMAnimation
//
//  Created by Gilson Santos on 03/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation

struct LocationModel: Decodable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
