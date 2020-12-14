//
//  ScreenViewProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import UIKit

protocol ScreenViewProtocol {
    func addViewHierarchy()
    func setupConstraints()
    func setupAdditional()
    func setupView()
    func isDarkMode() -> Bool
}

extension ScreenViewProtocol {
    func setupView() {
        self.addViewHierarchy()
        self.setupConstraints()
        self.setupAdditional()
    }
    
    func isDarkMode() -> Bool {
        return UIViewController().traitCollection.userInterfaceStyle == .dark
    }
}
