//
//  RequestConfigurationProtocol.swift
//  NetworkMD_Example
//
//  Created by Gilson Santos on 06/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

// MARK: - CONFIGURATION PROTOCOL -
public protocol RequestConfiguration: class {
    var httpMethod: HttpMethod { get set }
    var paramenters: [String: Any]? { get set }
    var headers: [String: String]? { get set }
    var timeOut: Double { get set }
    var baseUrl: String { get }
    var path: String { get set }
    init(baseUrl: String, path: String, httpMethod: HttpMethod, timeOut: Double)
}
