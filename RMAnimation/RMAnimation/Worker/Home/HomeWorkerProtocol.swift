//
//  HomeWorkerProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation
import NetworkMD

//MARK: - WORKER PROTOCOL -
protocol HomeWorkerProtocol: class {
    func getCharacter(url: String,  _ completion: @escaping (Result<CharacterModel, ErrorNetwork>) -> Void)
}
