//
//  FavoritePresenter.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - PRESENTER CLASS -
final class FavoritePresenter {
    
    private weak var view: FavoriteViewProtocol?
    
    init(view: FavoriteViewProtocol) {
        self.view = view
    }
}

//MARK: - PRESENTER PROTOCOL -
extension FavoritePresenter: FavoritePresenterProtocol {
    
}

//MARK: - AUX METHODS -
extension FavoritePresenter {
    
}
