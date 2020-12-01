//
//  HomeCoordinator.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

//MARK: - COORDINATOR CLASS -
final class HomeCoordinator: HomeCoordinatorProtocol {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = HomeService()
        let controller = HomeViewController()
        let presenter = HomePresenter(view: controller)
        let interactor = HomeInteractor(worker: service, presenter: presenter)
        controller.interactor = interactor
        controller.coordinator = self
        controller.title = "HOME"
        controller.view.backgroundColor = .red
        controller.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        self.navigationController.pushViewController(controller, animated: true)
    }
}
