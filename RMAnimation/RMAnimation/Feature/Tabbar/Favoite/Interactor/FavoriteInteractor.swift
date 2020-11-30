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
    
    private let worker: FavoriteWorkerProtocol
    private weak var presenter: FavoritePresenterProtocol?
    
    init(worker: FavoriteWorkerProtocol, presenter: FavoritePresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
}

//MARK: - INTERACTOR PROTOCOL -
extension FavoriteInteractor: FavoriteInteractorProtocol {
    
}

//MARK: - AUX METHODS -
extension FavoriteInteractor {
    
}
