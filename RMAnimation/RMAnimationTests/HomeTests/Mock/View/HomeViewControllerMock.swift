//
//  HomeViewControllerMock.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 09/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit
@testable import RMAnimation

final class HomeViewControllerMock: UIViewController, HomeViewProtocol {
    
    var stateView: StateView = .none
    var viewData: HomeViewData?
    var calledShowLoading = false
    
    func showLoading() {
        self.stateView = .loading
        self.viewData = nil
        self.calledShowLoading = true
    }
    
    func showSuccess(viewData: HomeViewData) {
        self.stateView = .success
        self.viewData = viewData
    }
    
    func showError() {
        self.stateView = .error
        self.viewData = nil
    }
}
