//
//  HomeViewController.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: CONSTANTS
    let homeScreen = HomeScreen()
    
    // MARK: VARIABLES
    var interactor: HomeInteractorProtocol?
    private lazy var viewData: HomeViewData = HomeViewData()
    weak var coordinator: HomeCoordinatorProtocol?
    
    // MARK: IBACTIONS
    @objc private func reload() {
        self.homeScreen.reloadAnimation {
            self.setupService()
        }
    }
    
    @objc private func refresh() {
        self.setupService()
        self.homeScreen.homeTableView.refreshControl?.endRefreshing()
    }
}

//MARK: - LIFE CYCLE -
extension HomeViewController {
    
    override func loadView() {
        super.loadView()
        self.view = self.homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupRefreshControl()
        self.setupTableView()
        self.registerCell()
        self.setupService()
        self.addGesture()
    }
}

//MARK: - TABLEVIEW DATASOURCE -
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeScreen.homeTableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.CELL_ID) as! CharacterTableViewCell
        cell.accessibilityIdentifier = Identifiers.homeTableViewCell + "\(indexPath.row)"
        cell.setupCell(viewData: self.viewData.characters[indexPath.row])
        return cell
    }
}

//MARK: - TABLEVIEW DELEGATE -
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterRow = self.viewData.characters[indexPath.row]
        self.coordinator?.showDetail(urlDetail: characterRow.urlDetail, characterName: characterRow.name)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.viewData.characters.count - 4, !self.viewData.isFinish {
            self.interactor?.getCharacter(request: HomeRequest(url: self.viewData.nextPage))
        }
    }
}

//MARK: - VIEW PROTOCOL -
extension HomeViewController: HomeViewProtocol {
    func showLoading() {
        guard !self.viewData.isPaginator else { return }
        self.homeScreen.loadingView.isHidden = false
        self.homeScreen.errorView.isHidden = true
        self.homeScreen.homeTableView.isHidden = true
    }
    
    func showSuccess(viewData: HomeViewData) {
        self.viewData.nextPage = viewData.nextPage
        self.viewData.isFinish = viewData.isFinish
        self.viewData.isPaginator = viewData.isPaginator
        self.viewData.characters += viewData.characters
        self.homeScreen.homeTableView.isHidden = false
        self.homeScreen.homeTableView.reloadData()
        self.homeScreen.loadingView.isHidden = true
    }
    
    func showError() {
        guard !self.viewData.isPaginator else { return }
        self.homeScreen.errorView.isHidden = false
        self.homeScreen.homeTableView.isHidden = true
        self.homeScreen.loadingView.isHidden = true
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
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.reload))
        self.homeScreen.errorView.addGestureRecognizer(tapGesture)
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        self.homeScreen.homeTableView.refreshControl = refreshControl
    }
}
