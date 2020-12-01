//
//  NetworkProtocol.swift
//  NetworkMD_Example
//
//  Created by Gilson Santos on 06/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

// MARK: - NETWORK PROTOCOL -
public protocol NetworkProtocol: class {
    func request(configuration: RequestConfiguration, _ completion: @escaping (Result<Data, ErrorNetwork>) -> Void)
}
