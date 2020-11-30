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
    
    private let worker: HomeWorkerProtocol
    private weak var presenter: HomePresenterProtocol?
    
    init(worker: HomeWorkerProtocol, presenter: HomePresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
}

//MARK: - INTERACTOR PROTOCOL -
extension HomeInteractor: HomeInteractorProtocol {
    
}

//MARK: - AUX METHODS -
extension HomeInteractor {
    
}
