//
//  HomeInteractorProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation

//MARK: - INTERACTOR PROTOCOL -
protocol HomeInteractorProtocol: class {
    func getCharacter(request: HomeRequest)
}
