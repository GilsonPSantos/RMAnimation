//
//  DetailViewController.swift
//  RMAnimation
//
//  Created by Gilson Santos on 02/12/20.
//  Copyright (c) 2020 Gilson Santos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
        
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
    func showLoading() {
        self.detailScreen.loadingView.isHidden = false
        self.detailScreen.errorView.isHidden = true
    }
    
    func showSuccess(viewData: DetailViewData) {
        self.setupView(viewData)
        self.detailScreen.loadingView.isHidden = true
    }
    
    func showError() {
        self.detailScreen.errorView.isHidden = false
        self.detailScreen.loadingView.isHidden = true
    }
}

//MARK: - AUX METHODS -
extension DetailViewController {
    private func setupView(_ viewData: DetailViewData) {
        self.detailScreen.descriptionOrigin.labelTitleName.text = viewData.originElement.titleName.rawValue
        self.detailScreen.descriptionOrigin.labelName.text = viewData.originElement.valueName
        
        self.detailScreen.descriptionOrigin.labelTitleType.text = viewData.originElement.titleType.rawValue
        self.detailScreen.descriptionOrigin.labelType.text = viewData.originElement.valueType
        
        self.detailScreen.descriptionOrigin.labelTitleDimension.text = viewData.originElement.titleDimension.rawValue
        self.detailScreen.descriptionOrigin.labelDimension.text = viewData.originElement.valueDimension
    }
}
