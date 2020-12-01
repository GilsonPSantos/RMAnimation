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
        self.homeScreen.homeTableView.dataSource = self
        self.homeScreen.homeTableView.delegate = self
        self.registerCell()
    }
}

//MARK: - TABLEVIEW DATASOURCE -
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeScreen.homeTableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.CELL_ID) as! CharacterTableViewCell
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
    
}

//MARK: - AUX METHODS -
extension HomeViewController {
    private func registerCell() {
        self.homeScreen.homeTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.CELL_ID)
    }
}
