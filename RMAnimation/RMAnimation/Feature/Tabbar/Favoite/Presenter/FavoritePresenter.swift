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
    func handlerSuccess(response: [FavoriteRequestResponse]) {
        let characterViewData = response.map { self.createViewData($0) }
        let viewData = FavoriteViewData(isEmptyList: characterViewData.count == 0, characters: characterViewData)
        self.view?.showSuccess(viewData: viewData)
    }
    
    func handlerEmpty() {
        self.view?.showEmptyMessage()
    }
}

//MARK: - AUX METHODS -
extension FavoritePresenter {
    private func createViewData(_ response: FavoriteRequestResponse) -> CharacterViewData {
        CharacterViewData(id: response.id, name: response.name, creationDate: response.creationDate, imageUrl: response.imageUrl, urlDetail: response.urlDetail)
    }
}
