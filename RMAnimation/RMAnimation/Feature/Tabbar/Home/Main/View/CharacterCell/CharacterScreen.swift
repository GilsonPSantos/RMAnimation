//
//  CharacterScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class CharacterScreen: UIView {
    
    public lazy var imageCharacter: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isAccessibilityElement = true
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let labelDate: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    public lazy var imageArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isAccessibilityElement = true
        imageView.backgroundColor = .yellow
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
extension CharacterScreen: ScreenViewProtocol {
    func addViewHierarchy() {
        self.addSubview(self.imageCharacter)
        self.addSubview(self.labelName)
        self.addSubview(self.labelDate)
        self.addSubview(self.imageArrow)
    }
    
    func setupConstraints() {
        self.imageCharacter.addConstraint(to: self, leading: 0, top: 0, bottom: 0, width: 60, height: 60)
        self.imageArrow.addConstraint(to: self, trailing: 0, width: 15, height: 15)
        self.imageArrow.addConstraint(to: self, centerVertically: true)
        self.labelName.addConstraint(to: self, top: 0)
        self.labelDate.addConstraint(to: self, bottom: 0)
        NSLayoutConstraint.activate([
            self.labelName.leadingAnchor.constraint(equalTo: self.imageCharacter.trailingAnchor, constant: 10),
            self.labelName.trailingAnchor.constraint(equalTo: self.imageArrow.leadingAnchor, constant: -5),
            self.labelDate.leadingAnchor.constraint(equalTo: self.imageCharacter.trailingAnchor, constant: 10),
            self.labelDate.trailingAnchor.constraint(equalTo: self.imageArrow.leadingAnchor, constant: -5),
            self.labelDate.topAnchor.constraint(greaterThanOrEqualTo: self.labelName.bottomAnchor, constant: 0)
        ])
    }
    
    func setupAdditional() {
        self.imageCharacter.layer.masksToBounds = true
        self.imageCharacter.layer.cornerRadius = 6
    }
}
