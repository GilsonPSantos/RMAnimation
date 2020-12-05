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
    
    func saveFavorite(id: Int) {
        let favoriteDataBase = Favorite(context: PersistentManager.shared.context)
        favoriteDataBase.id = Int16(id)
        PersistentManager.shared.saveContext()
    }
    
    func fetchFavorite(id: Int) -> Favorite? {
        return PersistentManager.shared.fetchDataBase(Favorite.self, id: id)
    }
    
    func removeFavorite(id: Int) {
        if let favoriteResult = self.fetchFavorite(id: id) {
            PersistentManager.shared.context.delete(favoriteResult)
        }
    }
}
