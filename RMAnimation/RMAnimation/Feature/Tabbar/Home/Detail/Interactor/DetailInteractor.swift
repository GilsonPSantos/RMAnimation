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
    private let dispatchSemaphore = DispatchSemaphore(value: 0)
    
    init(worker: BaseWorkerProtocol, presenter: DetailPresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
}

//MARK: - INTERACTOR PROTOCOL -
extension DetailInteractor: DetailInteractorProtocol {
    func getDetail(request: DetailRequest) {
        guard !request.url.isEmpty else { self.presenter?.handlerError(); return }
        self.presenter?.startRequest()
        DispatchQueue.global().async {
            
            self.getCharacterInfo(url: request.url, semaphore: self.dispatchSemaphore)
                        
            self.dispatchSemaphore.wait()
            self.getLocationInfo(url: self.response.urlLocation, semaphore: self.dispatchSemaphore)

            self.dispatchSemaphore.wait()
            if self.isValidResponse(self.response) {
                self.presenter?.handlerSuccess(response: self.response)
            } else {
                self.presenter?.handlerError()
            }
        }
        
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
    
    
    private func getLocationInfo(url: String, semaphore: DispatchSemaphore) {
        self.worker.getService(url: url, LocationModel.self) { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let resultModel):
                strongSelf.response.location = strongSelf.crateLocationResponse(resultModel)
            case .failure(_):
                strongSelf.presenter?.handlerError()
            }
            semaphore.signal()
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
        
        return DetailResponse(id: id, name: name, urlImage: urlImage, urlOrigin: originUrl, urlLocation: locationUrl)
    }
    
    private func crateLocationResponse(_ model: LocationModel) -> LocationResponse {
        guard let id = model.id, let name = model.name, let type = model.type, let dimension = model.dimension else { return LocationResponse() }
        return LocationResponse(id: id, name: name, type: type, dimension: dimension)
    }
    
    private func isValidResponse(_ response: DetailResponse) -> Bool {
        return true
    }
}
