//
//  LoadingScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class LoadingScreen: UIView {

    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .label
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
}

//MARK: - SCREEN VIEW PROTOCOL -
extension LoadingScreen: ScreenViewProtocol {
    func addViewHierarchy() {
        self.addSubview(self.activityIndicator)
    }
    
    func setupConstraints() {
        self.activityIndicator.addConstraint(to: self, centerHorizontally: true, centerVertically: true)
    }
    
    func setupAdditional() {
        self.backgroundColor = .systemBackground
    }
}
