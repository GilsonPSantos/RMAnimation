//
//  NetworkService.swift
//  NetworkMD_Example
//
//  Created by Gilson Santos on 06/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

final class NetworkService: NetworkProtocol {
    
    private let urlSession: URLSession
    private lazy var configuration: RequestConfiguration = NetworkConfiguration()
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request(configuration: RequestConfiguration, _ completion: @escaping (Result<Data, ErrorNetwork>) -> Void) {
        self.configuration = configuration
        guard let url = URL(string: self.configuration.baseUrl + self.configuration.path) else { completion(.failure(.genericError)); return }
        var request = self.createRequest(with: url)
        self.createHeaders(to: &request)
        do {
            try self.createBody(to: &request)
        } catch {
            completion(.failure((error as? ErrorNetwork) ?? ErrorNetwork.genericError))
        }
        self.callService(request, completion: completion)
    }
}

//MARK: - AUX METHODS -
extension NetworkService {
    private func callService(_ request: URLRequest, completion: @escaping (Result<Data, ErrorNetwork>) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    completion(.failure(.genericError))
                    return
                } else if let urlResponseService = response {
                    do {
                        try ValidationService.validationResponse(response: urlResponseService)
                    } catch {
                        completion(.failure((error as? ErrorNetwork) ?? ErrorNetwork.genericError))
                        return
                    }
                }
                if let dataService = data {
                    completion(.success(dataService))
                    return
                }
                completion(.failure(.genericError))
            }
        }.resume()
    }
    
    private func createRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: self.configuration.timeOut)
        urlRequest.httpMethod = self.configuration.httpMethod.rawValue
        return urlRequest
    }
    
    private func createBody(to request: inout URLRequest) throws {
        guard let parameters = self.configuration.paramenters else { return }
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
            request.httpBody = data
        } catch {
            throw ErrorNetwork.errorCreateBody
        }
    }
    
    private func createHeaders(to request: inout URLRequest) {
        guard let headers = self.configuration.headers else { return }
        request.allHTTPHeaderFields = headers
    }
}
