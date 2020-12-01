//
//  HomeService.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import NetworkMD

final class HomeService: HomeWorkerProtocol {
    
    private let configuration: NetworkConfiguration
    private let service = NetworkModule().getModule()
    
    init(configuration: NetworkConfiguration = NetworkConfiguration()) {
        self.configuration = configuration
    }
    
    func getCharacter(url: String, _ completion: @escaping (Result<CharacterModel, ErrorNetwork>) -> Void) {
        self.configuration.baseUrl = url
        self.service.request(configuration: self.configuration) { (result) in
            switch result {
            case .success(let data):
                do {
                    let characterModel = try JSONDecoder().decode(CharacterModel.self, from: data)
                    completion(.success(characterModel))
                } catch {
                    completion(.failure(.genericError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
