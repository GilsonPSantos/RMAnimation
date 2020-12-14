//
//  DescriptionScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class DescriptionScreen: UIView {
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .systemPink
        label.text = "Origin:"
        return label
    }()
    
    let labelTitleName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .systemPink
        return label
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let labelTitleType: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .systemPink
        return label
    }()
    
    let labelType: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let labelTitleDimension: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .systemPink
        return label
    }()
    
    let labelDimension: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private var isOrigin = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    init(isOrigin: Bool) {
        super.init(frame: UIScreen.main.bounds)
        self.isOrigin = isOrigin
        self.setupView()
    }
}

//MARK: - SCREEN VIEW PROTOCOL -
extension DescriptionScreen: ScreenViewProtocol {
    func addViewHierarchy() {
        self.addSubview(self.labelTitle)
        self.addSubview(self.labelTitleName)
         self.addSubview(self.labelName)
        self.addSubview(self.labelTitleType)
        self.addSubview(self.labelType)
        self.addSubview(self.labelTitleDimension)
        self.addSubview(self.labelDimension)
    }
    
    func setupConstraints() {
        self.labelTitle.addConstraint(to: self, leading: 10, trailing: 10, top: 10)
        
        self.labelTitleName.addConstraint(to: self, leading: 10)
        self.labelName.addConstraint(to: self, trailing: 10)
        
        self.labelTitleType.addConstraint(to: self, leading: 10)
        self.labelType.addConstraint(to: self, trailing: 10)
        
        self.labelTitleDimension.addConstraint(to: self, leading: 10)
        self.labelDimension.addConstraint(to: self, trailing: 10)

        NSLayoutConstraint.activate([
            self.labelTitleName.topAnchor.constraint(equalTo: self.labelTitle.bottomAnchor, constant: 10),
            self.labelName.topAnchor.constraint(equalTo: self.labelTitle.bottomAnchor, constant: 10),
            self.labelName.leadingAnchor.constraint(equalTo: self.labelTitleName.trailingAnchor, constant: 10),
            
            self.labelTitleType.topAnchor.constraint(equalTo: self.labelTitleName.bottomAnchor, constant: 10),
            self.labelType.topAnchor.constraint(equalTo: self.labelName.bottomAnchor, constant: 10),
            self.labelType.leadingAnchor.constraint(equalTo: self.labelTitleType.trailingAnchor, constant: 10),
            
            self.labelTitleDimension.topAnchor.constraint(equalTo: self.labelTitleType.bottomAnchor, constant: 10),
            self.labelDimension.topAnchor.constraint(equalTo: self.labelType.bottomAnchor, constant: 10),
            self.labelDimension.leadingAnchor.constraint(equalTo: self.labelTitleDimension.trailingAnchor, constant: 10),
        ])
        
    }
    
    func setupAdditional() {
        self.labelTitle.accessibilityIdentifier = Identifiers.labelTitleDetail + (isOrigin ? "origin" : "location")
        self.labelTitleName.accessibilityIdentifier = Identifiers.labelTitleNameDetail + (isOrigin ? "origin" : "location")
        self.labelName.accessibilityIdentifier = Identifiers.labelNameDetail + (isOrigin ? "origin" : "location")
        self.labelTitleType.accessibilityIdentifier = Identifiers.labelTitleTypeDetail + (isOrigin ? "origin" : "location")
        self.labelType.accessibilityIdentifier = Identifiers.labelTypeDetail + (isOrigin ? "origin" : "location")
        self.labelTitleDimension.accessibilityIdentifier = Identifiers.labelTitleDimensionDetail + (isOrigin ? "origin" : "location")
        self.labelDimension.accessibilityIdentifier = Identifiers.labelDimensionDetail + (isOrigin ? "origin" : "location")
        
        let backgroundColor: UIColor = isOrigin ? .systemPink : .orange
        
        self.labelTitle.backgroundColor = backgroundColor
        self.labelTitleName.backgroundColor = backgroundColor
        self.labelTitleType.backgroundColor = backgroundColor
        self.labelTitleDimension.backgroundColor = backgroundColor
    }
}
