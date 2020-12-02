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
        controller.title = "Lista de Personagens"
        controller.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        self.setupNavigation()
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    private func setupNavigation() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: self.navigationController.traitCollection.userInterfaceStyle == .dark ? UIColor.systemOrange : .black]
        self.navigationController.navigationBar.titleTextAttributes = textAttributes
    }
    
    func showDetail(id: Int, characterName: String) {
        let detailCoordinator = DetailCoordinator(navigationController: self.navigationController, titleScreen: characterName, id: id)
        detailCoordinator.parentCoordinator = self
        self.childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        self.childCoordinators.removeAll(where: {$0 === child})
    }
}
