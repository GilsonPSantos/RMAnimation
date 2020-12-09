//
//  DetailCoordinatorProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation


//MARK: - COORDINATOR PROTOCOL -
protocol DetailCoordinatorProtocol: Coordinator {
    var parentCoordinator: MainCoordinator? { get set }
    func didFinish()
}
