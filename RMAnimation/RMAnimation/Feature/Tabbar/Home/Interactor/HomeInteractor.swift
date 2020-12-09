//
//  HomeInteractor.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - INTERACTOR CLASS -
final class HomeInteractor {
    
    private let worker: BaseWorkerProtocol
    private let presenter: HomePresenterProtocol?
    
    init(worker: BaseWorkerProtocol, presenter: HomePresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
}

//MARK: - INTERACTOR PROTOCOL -
extension HomeInteractor: HomeInteractorProtocol {
    func getCharacter(request: HomeRequest) {
        guard !request.url.isEmpty else { self.presenter?.handlerError(); return }
        self.presenter?.startRequest()
        self.worker.getService(url: request.url, CharacterModel.self) { (result) in
            switch result {
            case .success(let characterModel):
                let response = self.createResponse(characterModel)
                if self.isValidResponse(response) {
                    self.presenter?.handlerSuccess(response: response)
                } else {
                    self.presenter?.handlerError()
                }
            case .failure(_):
                self.presenter?.handlerError()
            }
        }
    }
}

//MARK: - AUX METHODS -
extension HomeInteractor {
    private func createResponse(_ model: CharacterModel) -> HomeResponse {
        guard let info = model.info, let results = model.results else { return HomeResponse() }
        var response = HomeResponse(pages: info.pages ?? 0, count: info.count ?? 0, nextPage: info.next ?? "", isLastPage: info.next == nil)
        results.forEach({
            guard let id = $0.id, let name = $0.name, let urlImage = $0.image, let creationDate = $0.created?.stringToDate(), let urlDetail = $0.url else { return }
            response.characters.append(CharacterResponse( id: id, name: name, creationDate: creationDate, urlImage: urlImage, urlDetail: urlDetail))
        })
        return response
    }
    
    private func isValidResponse(_ response: HomeResponse) -> Bool {
        return response.characters.count > 0
    }
}
