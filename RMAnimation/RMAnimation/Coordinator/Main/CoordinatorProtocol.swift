//
//  CoordinatorProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import UIKit

//MARK: - COORDINATOR PROTOCOL -
public protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
