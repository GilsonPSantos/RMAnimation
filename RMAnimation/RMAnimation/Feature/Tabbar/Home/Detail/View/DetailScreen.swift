//
//  DetailScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class DetailScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
}

//MARK: - SCREEN VIEW PROTOCOL -
extension DetailScreen: ScreenViewProtocol {
    func addViewHierarchy() {
       
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditional() {
        self.backgroundColor = .systemBackground
    }
}
