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
    
}

//MARK: - AUX METHODS -
extension DetailPresenter {
    
}
