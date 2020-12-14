//
//  CharacterTableViewCell.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    static let CELL_ID = "characterCell"
    
    let characterScreen = CharacterScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - SCREEN VIEW PROTOCOL -
extension CharacterTableViewCell: ScreenViewProtocol {
    func addViewHierarchy() {
        self.contentView.addSubview(self.characterScreen)
    }
    
    func setupConstraints() {
        self.characterScreen.addConstraint(to: self.contentView, leading: 5, trailing: 5, top: 2, bottom: 2)
    }
    
    func setupAdditional() {
        self.selectionStyle = .none
        self.backgroundColor = .darkGray
    }
}

//MARK: - AUX METHODS -
extension CharacterTableViewCell {
    func setupCell(viewData: CharacterViewData) {
        self.characterScreen.labelName.text = viewData.name
        self.characterScreen.labelDate.text = viewData.creationDate
        self.characterScreen.imageCharacter.downloadImage(urlString: viewData.imageUrl, keyImage: viewData.name)
    }
}
