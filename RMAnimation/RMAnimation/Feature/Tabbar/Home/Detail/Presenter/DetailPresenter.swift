//
//  DetailPresenter.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - PRESENTER CLASS -
final class DetailPresenter {
    
    private weak var view: DetailViewProtocol?
    
    init(view: DetailViewProtocol) {
        self.view = view
    }
}

//MARK: - PRESENTER PROTOCOL -
extension DetailPresenter: DetailPresenterProtocol {
    func startRequest() {
        self.view?.showLoading()
    }
    
    func handlerSuccess(response: DetailResponse) {
        let viewData = self.createViewData(response)
        self.view?.showSuccess(viewData: viewData)
    }
    
    func handlerError() {
        self.view?.showError()
    }
}

//MARK: - AUX METHODS -
extension DetailPresenter {
    private func createViewData(_ response: DetailResponse) -> DetailViewData {
        let originViewData = self.createLocationElementViewData(response.origin)
        let locationViewData = self.createLocationElementViewData(response.location)
        return DetailViewData(id: response.id, name: response.name, urlBanner: response.urlImage, originElement: originViewData, locationElement: locationViewData, enableFavorite: response.isFavorite, urlDetail: response.urlDetail)
    }
    
    private func createLocationElementViewData(_ response: LocationResponse) -> LocationElementViewData {
        return LocationElementViewData(valueName: response.name, valueType: response.type, valueDimension: response.dimension)
    }
}
