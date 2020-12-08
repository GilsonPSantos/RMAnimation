//
//  FavoriteDataBase.swift
//  RMAnimation
//
//  Created by Gilson Santos on 04/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import CoreData

final class FavoriteDataBase: FavoriteDataBaseProtocol {
    
    func saveOrRemoveFavorite(request: FavoriteRequest) {
        var favoriteDataBase: Favorite?
        if let favoriteDB = self.fetchFavoriteById(id: request.id) {
            PersistentManager.shared.context.delete(favoriteDB)
        } else {
            favoriteDataBase = Favorite(context: PersistentManager.shared.context)
            favoriteDataBase?.id = Int16(request.id)
            favoriteDataBase?.name = request.name
            favoriteDataBase?.creationDate = request.creationDate
            favoriteDataBase?.imageUrl = request.imageUrl
            favoriteDataBase?.urlDetail = request.urlDetail
            PersistentManager.shared.saveContext()
        }
    }
    
    func fetchFavoriteById(id: Int) -> Favorite? {
        return PersistentManager.shared.fetchDataBase(Favorite.self, id: id)
    }
    
     func fetchFavoriteList() -> [Favorite]? {
        return PersistentManager.shared.fetchDataBase(Favorite.self)
     }
    
    func removeFavorite(id: Int) {
        if let favoriteResult = self.fetchFavoriteById(id: id) {
            PersistentManager.shared.context.delete(favoriteResult)
        }
    }
}
