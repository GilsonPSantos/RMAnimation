//
//  FavoriteCoordinator.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

//MARK: - COORDINATOR CLASS -
final class FavoriteCoordinator: FavoriteCoordinatorProtocol {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let dataBase = FavoriteDataBase()
        let controller = FavoriteViewController()
        let presenter = FavoritePresenter(view: controller)
        let interactor = FavoriteInteractor(dataBase: dataBase, presenter: presenter)
        controller.interactor = interactor
        controller.coordinator = self
        controller.title = "FAVORITOS"
        controller.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star"), tag: 1)
        self.navigationController.pushViewController(controller, animated: true)
        
    }
    
    func showDetail(urlDetail: String, characterName: String) {
        let detailCoordinator = DetailCoordinator(navigationController: self.navigationController, titleScreen: characterName, urlDetail: urlDetail)
        detailCoordinator.parentCoordinator = self
        self.childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        self.childCoordinators.removeAll(where: {$0 === child})
    }
}
