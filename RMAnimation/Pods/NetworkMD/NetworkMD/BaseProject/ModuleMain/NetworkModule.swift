//
//  NetworkModule.swift
//  NetworkMD_Example
//
//  Created by Gilson Santos on 06/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

open class NetworkModule {

    public init() {}

    public func getModule() -> NetworkProtocol {
        return NetworkService()
    }
}
