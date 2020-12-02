//
//  HomeViewController.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: OUTLETS
    
    // MARK: CONSTANTS
    let homeScreen = HomeScreen()
    // MARK: VARIABLES
    var interactor: HomeInteractorProtocol?
    private lazy var viewData: HomeViewData = HomeViewData()
    weak var coordinator: HomeCoordinatorProtocol?
    // MARK: IBACTIONS
}

//MARK: - LIFE CYCLE -
extension HomeViewController {
    
    override func loadView() {
        super.loadView()
        self.view = self.homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.registerCell()
        self.setupService()
    }
}

//MARK: - TABLEVIEW DATASOURCE -
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeScreen.homeTableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.CELL_ID) as! CharacterTableViewCell
        cell.setupCell(viewData: self.viewData.characters[indexPath.row])
        return cell
    }
}

//MARK: - TABLEVIEW DELEGATE -
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - VIEW PROTOCOL -
extension HomeViewController: HomeViewProtocol {
    func showLoading() {
        print("loading")
    }
    
    func showSuccess(viewData: HomeViewData) {
        self.viewData = viewData
        self.homeScreen.homeTableView.reloadData()
    }
    
    func showError() {
        print("error")
    }
}

//MARK: - AUX METHODS -
extension HomeViewController {
    private func registerCell() {
        self.homeScreen.homeTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.CELL_ID)
    }
    
    private func setupService() {
        self.interactor?.getCharacter(request: HomeRequest(url: "https://rickandmortyapi.com/api/character?page=1"))
    }
    
    private func setupTableView() {
        self.homeScreen.homeTableView.dataSource = self
        self.homeScreen.homeTableView.delegate = self
    }
}
