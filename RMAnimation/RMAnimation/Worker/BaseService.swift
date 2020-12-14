//
//  BaseService.swift
//  RMAnimation
//
//  Created by Gilson Santos on 03/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import NetworkMD

final class BaseService: BaseWorkerProtocol {
    
    private let configuration: NetworkConfiguration
    private let service = NetworkModule().getModule()
    
    init(configuration: NetworkConfiguration = NetworkConfiguration()) {
        self.configuration = configuration
    }
    
    func getService<T>(url: String, _ model: T.Type, _ completion: @escaping (Result<T, ErrorNetwork>) -> Void) where T : Decodable {
        guard Reachability.isConnectedToNetwork() else { completion(.failure(.notNetwork)); return }
        self.configuration.baseUrl = url
        self.service.request(configuration: self.configuration) { (result) in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(.genericError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
