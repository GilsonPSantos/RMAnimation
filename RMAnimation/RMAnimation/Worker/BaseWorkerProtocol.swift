//
//  BaseWorkerProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 03/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import NetworkMD

//MARK: - WORKER PROTOCOL -
protocol BaseWorkerProtocol: class {
    func getService<T>(url: String, _ model: T.Type,  _ completion: @escaping (Result<T, ErrorNetwork>) -> Void) where T : Decodable
}
