//
//  HomePresenter.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - PRESENTER CLASS -
final class HomePresenter {
    
    private weak var view: HomeViewProtocol?
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
}

//MARK: - PRESENTER PROTOCOL -
extension HomePresenter: HomePresenterProtocol {
    func startRequest() {
        self.view?.showLoading()
    }
    
    func handlerSuccess(response: HomeResponse) {
        let viewData = self.createViewData(response)
        self.view?.showSuccess(viewData: viewData)
    }
    
    func handlerError() {
        self.view?.showError()
    }
}

//MARK: - AUX METHODS -
extension HomePresenter {
    private func createViewData(_ response: HomeResponse) -> HomeViewData {
        var viewData = HomeViewData(isFinish: response.isLastPage, nextPage: response.nextPage)
        viewData.characters = response.characters.map({
            return CharacterViewData(id: $0.id, name: $0.name, creationDate: $0.creationDate.convertDateToStringDDMMYYYY(), imageUrl: $0.urlImage)
        })
         return viewData
    }
}
