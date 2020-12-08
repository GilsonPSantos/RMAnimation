//
//  DetailInteractor.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - INTERACTOR CLASS -
final class DetailInteractor {
    
    private let worker: BaseWorkerProtocol
    private let presenter: DetailPresenterProtocol?
    private var response = DetailResponse()
    private let dataBase: FavoriteDataBaseProtocol
    
    init(worker: BaseWorkerProtocol, presenter: DetailPresenterProtocol, favoriteDataBase: FavoriteDataBaseProtocol) {
        self.worker = worker
        self.presenter = presenter
        self.dataBase = favoriteDataBase
    }
}

//MARK: - INTERACTOR PROTOCOL -
extension DetailInteractor: DetailInteractorProtocol {
    
    func getDetail(request: DetailRequest) {
        guard !request.url.isEmpty else { self.presenter?.handlerError(); return }
        self.presenter?.startRequest()
        DispatchQueue.global().async {
            let dispatchSemaphore = DispatchSemaphore(value: 0)
            let dispatchGroup = DispatchGroup()
            
            self.getCharacterInfo(url: request.url, semaphore: dispatchSemaphore)
                        
            dispatchSemaphore.wait()
            self.getLocationInfo(url: self.response.urlLocation, dispatchGroup: dispatchGroup, isOrigin: false)
            self.getLocationInfo(url: self.response.urlOrigin, dispatchGroup: dispatchGroup, isOrigin: true)
            
            dispatchGroup.notify(queue: .main) {
                if self.isValidResponse(self.response) {
                    self.presenter?.handlerSuccess(response: self.response)
                } else {
                    self.presenter?.handlerError()
                }
            }
        }
    }
    
    func addOrRemoveFavorite(request: FavoriteRequest) {
        self.dataBase.saveOrRemoveFavorite(request: request)
    }
    
    private func getCharacterInfo(url: String, semaphore: DispatchSemaphore) {
        self.worker.getService(url: url, ResultModel.self) { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let resultModel):
                strongSelf.response = strongSelf.createCharacterResponse(resultModel)
            case .failure(_):
                strongSelf.presenter?.handlerError()
            }
            semaphore.signal()
        }
    }
    
    
    private func getLocationInfo(url: String, dispatchGroup: DispatchGroup, isOrigin: Bool) {
        dispatchGroup.enter()
        guard !url.isEmpty else { dispatchGroup.leave(); return }
        self.worker.getService(url: url, LocationModel.self) { [weak self] (result) in
            guard let strongSelf = self else { dispatchGroup.leave(); return }
            switch result {
            case .success(let resultModel):
                let locationResponse = strongSelf.crateLocationResponse(resultModel)
                if isOrigin {
                    strongSelf.response.origin = locationResponse
                } else {
                    strongSelf.response.location = locationResponse
                }
            case .failure(_):
                strongSelf.presenter?.handlerError()
            }
            dispatchGroup.leave()
        }
    }
}

//MARK: - AUX METHODS -
extension DetailInteractor {
    private func createCharacterResponse(_ model: ResultModel) -> DetailResponse {
        let id = model.id ?? 0
        let name = model.name ?? ""
        let urlImage = model.image ?? ""
        let originUrl = model.origin?.url ?? ""
        let locationUrl = model.location?.url ?? ""
        let isFavorite = self.dataBase.fetchFavoriteById(id: id) != nil
        return DetailResponse(id: id, name: name, urlImage: urlImage, urlOrigin: originUrl, urlLocation: locationUrl, isFavorite: isFavorite)
    }
    
    private func crateLocationResponse(_ model: LocationModel) -> LocationResponse {
        guard let id = model.id, let name = model.name, let type = model.type, let dimension = model.dimension else { return LocationResponse() }
        return LocationResponse(id: id, name: name, type: type, dimension: dimension)
    }
    
    private func isValidResponse(_ response: DetailResponse) -> Bool {
        return self.response.id > 0 && !self.response.urlImage.isEmpty
            && !self.response.origin.name.isEmpty && !self.response.origin.type.isEmpty
            && !self.response.origin.dimension.isEmpty && !self.response.location.name.isEmpty
            && !self.response.location.type.isEmpty && !self.response.location.dimension.isEmpty
    }
}
