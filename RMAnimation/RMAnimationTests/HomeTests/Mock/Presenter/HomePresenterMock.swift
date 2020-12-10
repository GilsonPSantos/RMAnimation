//
//  HomePresenterMock.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 09/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
@testable import RMAnimation

final class HomePresenterMock: HomePresenterProtocol {
    
    var stateView: StateView = .none
    var response: HomeResponse?
    private weak var view: HomeViewProtocol?
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func startRequest() {
        self.stateView = .loading
        self.response = nil
    }
    
    func handlerSuccess(response: HomeResponse) {
        self.stateView = .success
        self.response = response
    }
    
    func handlerError() {
        self.stateView = .error
        self.response = nil
    }
}
