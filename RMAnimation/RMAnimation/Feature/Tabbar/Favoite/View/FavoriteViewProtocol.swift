//
//  FavoriteViewProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - VIEW PROTOCOL -
protocol FavoriteViewProtocol: class {
    func showSuccess(viewData: FavoriteViewData)
    func showEmptyMessage()
}

