//
//  DetailCoordinator.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

//MARK: - COORDINATOR CLASS -
final class DetailCoordinator: DetailCoordinatorProtocol {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let titleScreen: String
    private let urlDetail: String
    
    init(navigationController: UINavigationController, titleScreen: String, urlDetail: String) {
        self.navigationController = navigationController
        self.titleScreen = titleScreen
        self.urlDetail = urlDetail
    }
    
    func start() {
        let service = BaseService()
        let controller = DetailViewController(urlDetail: self.urlDetail)
        let presenter = DetailPresenter(view: controller)
        let interactor = DetailInteractor(worker: service, presenter: presenter, favoriteDataBase: FavoriteDataBase())
        controller.interactor = interactor
        controller.coordinator = self
        controller.title = self.titleScreen
        controller.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func didFinish() {
        self.parentCoordinator?.childDidFinish(self)
    }
}
