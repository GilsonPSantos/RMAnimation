//
//  FavoriteInteractor.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - INTERACTOR CLASS -
final class FavoriteInteractor {
    
    private let dataBase: FavoriteDataBaseProtocol
    private let presenter: FavoritePresenterProtocol?
    
    init(dataBase: FavoriteDataBaseProtocol, presenter: FavoritePresenterProtocol) {
        self.dataBase = dataBase
        self.presenter = presenter
    }
}

//MARK: - INTERACTOR PROTOCOL -
extension FavoriteInteractor: FavoriteInteractorProtocol {
    func getFavoriteList() {
        guard let result = self.dataBase.fetchFavoriteList(), result.count > 0 else { self.presenter?.handlerEmpty()
            return
        }
        let response = result.map { self.createResponse(favoriteDB: $0 )}
        self.presenter?.handlerSuccess(response: response)
    }
}

//MARK: - AUX METHODS -
extension FavoriteInteractor {
    private func createResponse(favoriteDB: Favorite) -> FavoriteRequestResponse {
        FavoriteRequestResponse(id: Int(favoriteDB.id), name: favoriteDB.name ?? "", creationDate: favoriteDB.creationDate ?? "", imageUrl: favoriteDB.imageUrl ?? "", urlDetail: favoriteDB.urlDetail ?? "")
    }
}
