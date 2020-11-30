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
    
}

//MARK: - AUX METHODS -
extension HomePresenter {
    
}
