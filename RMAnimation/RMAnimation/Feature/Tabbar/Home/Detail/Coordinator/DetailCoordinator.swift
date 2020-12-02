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
    private let id: Int
    
    init(navigationController: UINavigationController, titleScreen: String, id: Int) {
        self.navigationController = navigationController
        self.titleScreen = titleScreen
        self.id = id
    }
    
    func start() {
        let service = DetailService()
        let controller = DetailViewController(identifier: self.id)
        let presenter = DetailPresenter(view: controller)
        let interactor = DetailInteractor(worker: service, presenter: presenter)
        controller.interactor = interactor
        controller.coordinator = self
        controller.title = self.titleScreen
        controller.identifier = self.id
        controller.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func didFinish() {
        self.parentCoordinator?.childDidFinish(self)
    }
}
