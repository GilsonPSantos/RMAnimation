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
    
    override func loadView() {
        super.loadView()
        self.view = self.favoriteScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.getFavoriteList()
    }
}

//MARK: - VIEW PROTOCOL -
extension FavoriteViewController: FavoriteViewProtocol {
    func showSuccess(viewData: FavoriteViewData) {
        self.viewData = viewData
        self.favoriteScreen.favoriteTableView.reloadData()
        self.favoriteScreen.labelMessage.isHidden = true
        self.favoriteScreen.favoriteTableView.isHidden = false
    }
    
    func showEmptyMessage() {
        self.favoriteScreen.labelMessage.text = self.viewData.emptyMessage
        self.favoriteScreen.favoriteTableView.isHidden = true
        self.favoriteScreen.labelMessage.isHidden = false
    }
}

//MARK: - TABLEVIEW DATASOURCE -
extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.favoriteScreen.favoriteTableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.CELL_ID) as! CharacterTableViewCell
        cell.setupCell(viewData: self.viewData.characters[indexPath.row])
        return cell
    }
}

//MARK: - TABLEVIEW DELEGATE -
extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - AUX METHODS -
extension FavoriteViewController {
    private func registerCell() {
        self.favoriteScreen.favoriteTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.CELL_ID)
    }
    
    private func setupTableView() {
        self.favoriteScreen.favoriteTableView.dataSource = self
        self.favoriteScreen.favoriteTableView.delegate = self
    }
}
