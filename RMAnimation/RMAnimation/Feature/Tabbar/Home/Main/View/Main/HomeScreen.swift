//
//  HomeScreen.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit

class HomeScreen: UIView {
    
    let errorView = ErrorScreen()
    let loadingView = LoadingScreen()

    lazy var homeTableView: UITableView = {
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
        self.addSubview(self.errorView)
        self.addSubview(self.loadingView)
    }
    
    func setupConstraints() {
        self.homeTableView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
        self.errorView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
        self.loadingView.addConstraint(to: self, leading: 0, trailing: 0, top: 0, bottom: 0)
    }
    
    func setupAdditional() {
        self.homeTableView.backgroundColor = .systemBackground
    }
}

//MARK: - AUX METHODS -
extension HomeScreen {
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
