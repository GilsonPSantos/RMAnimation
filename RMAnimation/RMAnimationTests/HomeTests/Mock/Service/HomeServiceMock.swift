//
//  HomeServiceMock.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 09/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
@testable import RMAnimation
@testable import NetworkMD

final class HomeServiceMock: BaseServiceTests, BaseWorkerProtocol {
    
    func getService<T>(url: String, _ model: T.Type, _ completion: @escaping (Result<T, ErrorNetwork>) -> Void) where T : Decodable {
        switch self.statusService {
        case .error(let error):
            completion(.failure(error))
        default:
            let data = self.getServiceMock(fileName: self.fileName)
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(.genericError))
            }
        }
    }
}
