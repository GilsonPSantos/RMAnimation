//
//  ErrorScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class ErrorScreen: UIView {

    public lazy var imageReload: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "goforward")
        imageView.tintColor = self.isDarkMode() ? #colorLiteral(red: 0.4235294163, green: 0.7529411912, blue: 0.2901960909, alpha: 1) : .darkGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var labelMessage: UILabel = {
        let label = UILabel()
        label.text = "Erro ao atualizar as informações\nToque para recarregar."
        label.textColor = self.isDarkMode() ? #colorLiteral(red: 0.4235294163, green: 0.7529411912, blue: 0.2901960909, alpha: 1) : .darkGray
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
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
extension ErrorScreen: ScreenViewProtocol {
    func addViewHierarchy() {
        self.addSubview(self.labelMessage)
        self.addSubview(self.imageReload)
    }
    
    func setupConstraints() {
        self.setupLabelMessage()
        self.setuImageReload()
    }
    
    func setupAdditional() {
        self.backgroundColor = .systemBackground
    }
}

//MARK: - AUX METHODS -
extension ErrorScreen {
    
    private func setupLabelMessage() {
        self.labelMessage.addConstraint(to: self, leading: 10, trailing: 10)
        self.labelMessage.addConstraint(to: self, centerHorizontally: true, centerVertically: true, constantY: -20)
    }
    
    private func setuImageReload() {
        self.imageReload.addConstraint(width: 50, height: 50)
        self.imageReload.addConstraint(to: self, centerHorizontally: true)
        self.imageReload.topAnchor.constraint(equalTo: self.labelMessage.bottomAnchor, constant: 20).isActive = true
    }
    
}

