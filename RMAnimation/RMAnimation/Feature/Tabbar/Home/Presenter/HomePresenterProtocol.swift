//
//  HomePresenterProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - PRESENTER PROTOCOL -
protocol HomePresenterProtocol: class {
    func startRequest()
    func handlerSuccess(response: HomeResponse)
    func handlerError()
}

