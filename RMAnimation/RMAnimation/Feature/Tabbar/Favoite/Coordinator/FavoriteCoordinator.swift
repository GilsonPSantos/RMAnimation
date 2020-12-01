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
        let service = FavoriteService()
        let controller = FavoriteViewController()
        let presenter = FavoritePresenter(view: controller)
        let interactor = FavoriteInteractor(worker: service, presenter: presenter)
        controller.interactor = interactor
        controller.coordinator = self
        controller.title = "FAVORITOS"
        controller.view.backgroundColor = .yellow
        controller.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star"), tag: 1)
        self.navigationController.pushViewController(controller, animated: true)
        
    }
    
    

}
