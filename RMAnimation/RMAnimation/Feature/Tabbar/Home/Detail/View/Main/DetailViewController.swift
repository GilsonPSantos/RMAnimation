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
    var urlDetail = ""
    
    // MARK: IBACTIONS
}

//MARK: - LIFE CYCLE -
extension DetailViewController {
    
    convenience init(urlDetail: String) {
        self.init(nibName: nil, bundle: nil)
        self.urlDetail = urlDetail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailScreen
        self.interactor?.getDetail(request: DetailRequest(url: self.urlDetail))
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
