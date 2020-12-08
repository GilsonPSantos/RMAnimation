//
//  FavoriteScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 07/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class FavoriteScreen: UIView {

   lazy var favoriteTableView: UITableView = {
       let tableView = UITableView()
       tableView.separatorStyle = .none
       return tableView
   }()
    
    lazy var labelMessage: UILabel = {
        let label = UILabel()
        label.textColor = self.isDarkMode() ? #colorLiteral(red: 0.4235294163, green: 0.7529411912, blue: 0.2901960909, alpha: 1) : .darkGray
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
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
extension FavoriteScreen: ScreenViewProtocol {
    func addViewHierarchy() {
        self.addSubview(self.favoriteTableView)
        self.addSubview(self.labelMessage)
    }
    
    func setupConstraints() {
        self.favoriteTableView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
        self.labelMessage.addConstraint(to: self, centerVertically: true)
        self.labelMessage.addConstraint(to: self, leading: 10, trailing: 10)
    }
    
    func setupAdditional() {
        self.favoriteTableView.backgroundColor = .systemBackground
        self.labelMessage.isHidden = true
    }
}
