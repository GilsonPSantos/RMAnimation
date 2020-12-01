//
//  HomeScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class HomeScreen: UIView {

    public lazy var homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
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
extension HomeScreen: ScreenViewProtocol {
    func addViewHierarchy() {
        self.addSubview(self.homeTableView)
    }
    
    func setupConstraints() {
        self.homeTableView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
    }
    
    func setupAdditional() {
        self.homeTableView.backgroundColor = .systemBackground
    }

}
