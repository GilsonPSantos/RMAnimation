//
//  DetailViewControllerMock.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 11/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit
@testable import RMAnimation

final class DetailViewControllerMock: UIViewController, DetailViewProtocol {
    
    var stateView: StateView = .none
    var viewData: DetailViewData?
    var calledShowLoading = false
    
    func showLoading() {
        self.stateView = .loading
        self.viewData = nil
        self.calledShowLoading = true
    }
    
    func showSuccess(viewData: DetailViewData) {
        self.stateView = .success
        self.viewData = viewData
    }
    
    func showError() {
        self.stateView = .error
        self.viewData = nil
    }
}
