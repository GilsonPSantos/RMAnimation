//
//  FavoriteDataBaseProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 04/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation

protocol FavoriteDataBaseProtocol: class {
    func saveOrRemoveFavorite(request: FavoriteRequest)
    func fetchFavoriteById(id: Int) -> Favorite?
    func fetchFavoriteList() -> [Favorite]?
}
