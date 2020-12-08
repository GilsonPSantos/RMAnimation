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
        
    }
}

//MARK: - AUX METHODS -
extension FavoriteInteractor {
    
}
