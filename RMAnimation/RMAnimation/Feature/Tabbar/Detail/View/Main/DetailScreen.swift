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
    let descriptionOrigin = DescriptionScreen(isOrigin: true)
    let descriptionLocation = DescriptionScreen(isOrigin: false)
    
    lazy var imageBanner: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.isAccessibilityElement = true
        imageView.accessibilityIdentifier = Identifiers.imageBannerDetail
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
        self.addSubview(self.descriptionOrigin)
        self.addSubview(self.descriptionLocation)
        self.addSubview(self.errorView)
        self.addSubview(self.loadingView)
    }
    
    func setupConstraints() {
        self.errorView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
        self.loadingView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
        self.imageBanner.addConstraint(to: self, leading: 0, trailing: 0, top: 90, height: 300)
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
        self.descriptionOrigin.accessibilityIdentifier = Identifiers.descriptionOriginView
        self.descriptionLocation.accessibilityIdentifier = Identifiers.descriptionLocationView
        self.backgroundColor = .systemBackground
    }
}

//MARK: - AUX METHODS -
extension DetailScreen {
    func reloadAnimation(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration:0.2, animations: { () -> Void in
            self.errorView.imageReload.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat(Double.pi)))
        })
        UIView.animate(withDuration: 0.2, delay: 0.15, options: .curveEaseIn, animations: { () -> Void in
            self.errorView.imageReload.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat(Double.pi * 2)))
        }) { (isAnimationComplete) in
            completion()
        }
    }
}
