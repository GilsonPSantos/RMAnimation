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
    @objc private func addOrRemoveFavorite() {
        let favoriteRequest = FavoriteRequestResponse(id: self.viewData.id, name: self.viewData.name, creationDate: "", imageUrl: self.viewData.urlBanner, urlDetail: self.viewData.urlDetail)
        self.interactor?.addOrRemoveFavorite(request: favoriteRequest)
        self.viewData.enableFavorite.toggle()
        let nameImage = self.viewData.enableFavorite ? "star.fill" : "star"
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: nameImage)
    }
    
    @objc private func reload() {
        self.detailScreen.reloadAnimation {
            self.interactor?.getDetail(request: DetailRequest(url: self.urlDetail))
        }
    }
}

//MARK: - LIFE CYCLE -
extension DetailViewController {
    
    convenience init(urlDetail: String) {
        self.init(nibName: nil, bundle: nil)
        self.urlDetail = urlDetail
    }
    
    override func loadView() {
        super.loadView()
        self.view = detailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        self.addGesture()
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
        self.viewData = viewData
        self.detailScreen.descriptionOrigin.labelTitle.text = "Origin:"
        self.detailScreen.descriptionOrigin.labelTitleName.text = viewData.originElement.titleName.rawValue
        self.detailScreen.descriptionOrigin.labelName.text = viewData.originElement.valueName
        
        self.detailScreen.descriptionOrigin.labelTitleType.text = viewData.originElement.titleType.rawValue
        self.detailScreen.descriptionOrigin.labelType.text = viewData.originElement.valueType
        
        self.detailScreen.descriptionOrigin.labelTitleDimension.text = viewData.originElement.titleDimension.rawValue
        self.detailScreen.descriptionOrigin.labelDimension.text = viewData.originElement.valueDimension
        
        self.detailScreen.descriptionLocation.labelTitle.text = "Location:"
        self.detailScreen.descriptionLocation.labelTitleName.text = viewData.locationElement.titleName.rawValue
        self.detailScreen.descriptionLocation.labelName.text = viewData.locationElement.valueName
        
        self.detailScreen.descriptionLocation.labelTitleType.text = viewData.locationElement.titleType.rawValue
        self.detailScreen.descriptionLocation.labelType.text = viewData.locationElement.valueType
        
        self.detailScreen.descriptionLocation.labelTitleDimension.text = viewData.locationElement.titleDimension.rawValue
        self.detailScreen.descriptionLocation.labelDimension.text = viewData.locationElement.valueDimension
        self.detailScreen.imageBanner.downloadImage(urlString: viewData.urlBanner, keyImage: viewData.urlBanner)
        
        let nameImage = viewData.enableFavorite ? "star.fill" : "star"
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: nameImage)
    }
    
    private func setupNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: #selector(self.addOrRemoveFavorite))
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = Identifiers.buttonAddFavorite
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.reload))
        self.detailScreen.errorView.addGestureRecognizer(tapGesture)
    }
}
