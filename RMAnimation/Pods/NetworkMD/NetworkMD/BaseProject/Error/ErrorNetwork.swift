//
//  ErrorNetwork.swift
//  NetworkMD_Example
//
//  Created by Gilson Santos on 06/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

public enum ErrorNetwork: Error {
    case genericError
    case notNetwork
    case errorCreateBody
}
//200..<300
final class ValidationService {
    class func validationResponse(response: URLResponse) throws -> Void {
        guard let responseService = response as? HTTPURLResponse else { throw ErrorNetwork.genericError }
        if responseService.statusCode > 300 {
            throw ErrorNetwork.genericError
        }
    }
}
