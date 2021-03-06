//
//  HomeViewProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - VIEW PROTOCOL -
protocol HomeViewProtocol: class {
    func showLoading()
    func showSuccess(viewData: HomeViewData)
    func showError()
}

