//
//  MainCoordinator.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation

protocol MainCoordinator: Coordinator {
    func childDidFinish(_ child: Coordinator?)
}
