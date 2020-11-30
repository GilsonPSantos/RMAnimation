//
//  HomeViewController.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: OUTLETS
    
    // MARK: CONSTANTS
    
    // MARK: VARIABLES
    var interactor: HomeInteractorProtocol?
    private lazy var viewData: HomeViewData = HomeViewData()
    weak var coordinator: HomeCoordinatorProtocol?
    // MARK: IBACTIONS
}

//MARK: - LIFE CYCLE -
extension HomeViewController {
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - VIEW PROTOCOL -
extension HomeViewController: HomeViewProtocol {
    
}

//MARK: - AUX METHODS -
extension HomeViewController {
 
}
