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
    
    private let worker: DetailWorkerProtocol
    private let presenter: DetailPresenterProtocol?
    
    init(worker: DetailWorkerProtocol, presenter: DetailPresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
}

//MARK: - INTERACTOR PROTOCOL -
extension DetailInteractor: DetailInteractorProtocol {
    
}

//MARK: - AUX METHODS -
extension DetailInteractor {
    
}
