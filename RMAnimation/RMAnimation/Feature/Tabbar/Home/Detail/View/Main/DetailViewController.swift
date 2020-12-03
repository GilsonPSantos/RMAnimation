//
//  DetailViewController.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: OUTLETS
    
    // MARK: CONSTANTS
    let detailScreen = DetailScreen()
    // MARK: VARIABLES
    var interactor: DetailInteractorProtocol?
    private lazy var viewData:DetailViewData = DetailViewData()
    weak var coordinator: DetailCoordinatorProtocol?
    var identifier = 0
    
    // MARK: IBACTIONS
}

//MARK: - LIFE CYCLE -
extension DetailViewController {
    
    convenience init(identifier: Int) {
        self.init(nibName:nil, bundle:nil)
        self.identifier = identifier
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailScreen
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.coordinator?.didFinish()
    }
}

//MARK: - VIEW PROTOCOL -
extension DetailViewController: DetailViewProtocol {

}

//MARK: - AUX METHODS -
extension DetailViewController {
 
}
