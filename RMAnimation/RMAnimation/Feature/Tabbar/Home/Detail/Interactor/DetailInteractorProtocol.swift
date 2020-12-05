//
//  DetailInteractorProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - INTERACTOR PROTOCOL -
protocol DetailInteractorProtocol: class {
    func getDetail(request: DetailRequest)
    func addFavorite(id: Int)
    func removeFavorite(id: Int)
}
