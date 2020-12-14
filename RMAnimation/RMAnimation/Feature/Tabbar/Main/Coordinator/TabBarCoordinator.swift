//
//  TabBarCoordinator.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import UIKit

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.navigationController.setNavigationBarHidden(true, animated: false)
        let tabbar = TabBarViewController()
        self.navigationController.pushViewController(tabbar, animated: false)
        let homeNavigation = UINavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigation)
        self.childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        let favoriteNavigation = UINavigationController()
        let favoriteCoordinator = FavoriteCoordinator(navigationController: favoriteNavigation)
        self.childCoordinators.append(favoriteCoordinator)
        favoriteCoordinator.start()
        
        tabbar.viewControllers = [homeNavigation, favoriteNavigation]
    }
    
    
    
}
