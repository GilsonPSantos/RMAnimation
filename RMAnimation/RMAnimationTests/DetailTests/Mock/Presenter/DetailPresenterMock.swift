//
//  DetailPresenterMock.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 11/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
@testable import RMAnimation

final class DetailPresenterMock: DetailPresenterProtocol {
    
    var stateView: StateView = .none
    var response: DetailResponse?
    private weak var view: DetailViewProtocol?
    var calledStartRequest = false
    
    init(view: DetailViewProtocol) {
        self.view = view
    }
    
    func startRequest() {
        self.stateView = .loading
        self.response = nil
        self.calledStartRequest = true
    }
    
    func handlerSuccess(response: DetailResponse) {
        self.stateView = .success
        self.response = response
    }
    
    func handlerError() {
        self.stateView = .error
        self.response = nil
    }
}
