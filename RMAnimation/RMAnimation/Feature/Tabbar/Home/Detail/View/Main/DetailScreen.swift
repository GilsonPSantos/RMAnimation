//
//  DetailScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class DetailScreen: UIView {
    
    let errorView = ErrorScreen()
    let loadingView = LoadingScreen()
    let descriptionOrigin = DescriptionScreen()
    let descriptionLocation = DescriptionScreen()
    
    lazy var imageBanner: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isAccessibilityElement = true
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    lazy var imageStar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isAccessibilityElement = true
        imageView.image = UIImage(systemName: "star")
        return imageView
    }()
    
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
        self.addSubview(self.imageBanner)
        self.addSubview(self.self.imageStar)
        self.addSubview(self.descriptionOrigin)
        self.addSubview(self.descriptionLocation)
        self.addSubview(self.errorView)
        self.addSubview(self.loadingView)
    }
    
    func setupConstraints() {
        self.errorView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
        self.loadingView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
        self.imageBanner.addConstraint(to: self, leading: 0, trailing: 0, top: 0, height: 300)
        self.imageStar.addConstraint(to: self, trailing: 10, top: 100, width: 50, height: 50)
        self.descriptionOrigin.addConstraint(to: self, leading: 0, trailing: 0)
        
        self.descriptionLocation.addConstraint(to: self, leading: 0, trailing: 0)
        
        NSLayoutConstraint.activate([
            self.descriptionOrigin.topAnchor.constraint(equalTo: self.imageBanner.bottomAnchor, constant: 10),
            self.descriptionOrigin.heightAnchor.constraint(greaterThanOrEqualToConstant: 140),
            
            self.descriptionLocation.topAnchor.constraint(equalTo: self.descriptionOrigin.bottomAnchor, constant: 10),
            self.descriptionLocation.heightAnchor.constraint(greaterThanOrEqualToConstant: 140),
        ])
    }
    
    func setupAdditional() {
        self.backgroundColor = .systemBackground
        self.descriptionOrigin.backgroundColor = .yellow
        self.descriptionLocation.backgroundColor = .red
        self.loadingView.backgroundColor = .systemRed
    }
}
