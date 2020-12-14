//
//  DetailServiceMock.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 11/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
@testable import RMAnimation
@testable import NetworkMD

final class DetailServiceMock: BaseServiceTests, BaseWorkerProtocol {

    func getService<T>(url: String, _ model: T.Type, _ completion: @escaping (Result<T, ErrorNetwork>) -> Void) where T : Decodable {
        switch self.statusService {
        case .error(let error):
            completion(.failure(error))
        default:
            let fileName = model == LocationModel.self ? url : self.fileName
            let data = self.getServiceMock(fileName: fileName)
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(.genericError))
            }
        }
    }
}
