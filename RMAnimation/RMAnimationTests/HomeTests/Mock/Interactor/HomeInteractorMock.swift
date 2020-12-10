//
//  HomeInteractorMock.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 09/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
@testable import RMAnimation

final class HomeInteractorMock: HomeInteractorProtocol {
    
    private let worker: BaseWorkerProtocol
    private let presenter: HomePresenterProtocol?
    var model: CharacterModel?
    var stateView: StateView = .none
    
    init(worker: BaseWorkerProtocol, presenter: HomePresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func getCharacter(request: HomeRequest) {
        self.worker.getService(url: request.url, CharacterModel.self) { (result) in
            switch result {
            case .success(let characterModel):
                self.stateView = .success
                self.model = characterModel
            case .failure(_):
                self.stateView = .error
                self.model = nil
            }
        }
    }
}
