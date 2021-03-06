//
//  HomeCoordinatorProtocol.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import Foundation


//MARK: - COORDINATOR PROTOCOL -
protocol HomeCoordinatorProtocol: MainCoordinator {
    func showDetail(urlDetail: String, characterName: String)
}
