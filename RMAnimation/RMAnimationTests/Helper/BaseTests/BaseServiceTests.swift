//
//  BaseServiceTests.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 09/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
@testable import NetworkMD

protocol BaseTestProtocol {
    var statusService: StatusTest { get set }
}

enum StatusTest {
    case loading
    case success
    case error(ErrorNetwork)
}

enum StateView {
    case loading
    case success
    case error
    case none
    case empty
    case finish
}

class BaseServiceTests: BaseTestProtocol {
    
    var statusService: StatusTest = .success
    var fileName = ""
    
    func getServiceMock(fileName: String) -> Data {
        guard let pathUrl = Bundle(for: Self.self).url(forResource: fileName, withExtension: "json") else {
            fatalError("Erro ao buscar o arquivo.")
        }
        do {
            let data = try Data(contentsOf: pathUrl)
            return data
        } catch {
            fatalError("Erro ao transformar o Data.")
        }
    }
}
