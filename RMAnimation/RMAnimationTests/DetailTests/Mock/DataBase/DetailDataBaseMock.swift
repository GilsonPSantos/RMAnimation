//
//  DetailDataBaseMock.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 11/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
@testable import RMAnimation

final class DetailDataBaseMock: FavoriteDataBaseProtocol {
    
    var dataBase: [Favorite]?
    
    func saveOrRemoveFavorite(request: FavoriteRequestResponse) {
        if let favoriteList = self.dataBase, let index = favoriteList.firstIndex(where: { request.id == $0.id}) {
            self.removeFavorite(id: index)
            if self.dataBase?.count == 0 {
                self.dataBase = nil
            }
        } else {
            self.dataBase = []
            let favorite = Favorite(context: PersistentManager.shared.context)
            favorite.id = Int16(request.id)
            favorite.creationDate = request.creationDate
            favorite.imageUrl = request.imageUrl
            favorite.name = request.name
            favorite.urlDetail = request.urlDetail
            self.dataBase?.append(favorite)
        }
    }
    
    func fetchFavoriteById(id: Int) -> Favorite? {
        self.dataBase?.first(where: { $0.id == id})
    }
    
    func fetchFavoriteList() -> [Favorite]? {
        self.dataBase
    }
    
    func removeFavorite(id: Int) {
        self.dataBase?.remove(at: id)
    }
}
