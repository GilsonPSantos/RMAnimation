//
//  RequestConfiguration.swift
//  NetworkMD_Example
//
//  Created by Gilson Santos on 06/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

open class NetworkConfiguration: RequestConfiguration {
    public var baseUrl: String
    public var path: String
    public var httpMethod: HttpMethod
    public var paramenters: [String : Any]?
    public var headers: [String : String]?
    public var timeOut: Double
    required public init(baseUrl: String = "", path: String = "", httpMethod: HttpMethod = .get, timeOut: Double = 10) {
        self.httpMethod = httpMethod
        self.timeOut = timeOut
        self.baseUrl = baseUrl
        self.path = path
    }
}
