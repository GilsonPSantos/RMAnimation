//
//  FavoriteViewController.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
        
    // MARK: CONSTANTS
    let favoriteScreen = FavoriteScreen()
    
    // MARK: VARIABLES
    var interactor: FavoriteInteractorProtocol?
    private lazy var viewData:FavoriteViewData = FavoriteViewData()
    weak var coordinator: FavoriteCoordinatorProtocol?
    
    // MARK: IBACTIONS
}

//MARK: - LIFE CYCLE -
extension FavoriteViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - VIEW PROTOCOL -
extension FavoriteViewController: FavoriteViewProtocol {

}

//MARK: - AUX METHODS -
extension FavoriteViewController {
    private func registerCell() {
        self.favoriteScreen.favoriteTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.CELL_ID)
    }
}
