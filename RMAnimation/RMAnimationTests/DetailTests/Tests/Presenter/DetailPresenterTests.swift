//
//  DetailPresenterTests.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 13/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import XCTest
@testable import RMAnimation

class DetailPresenterTests: XCTestCase {

    private var serviceMock: DetailServiceMock!
    private var controllerMock: DetailViewControllerMock!
    private var dataBaseMock: FavoriteDataBaseProtocol!
    private var presenterMock: DetailPresenter!
    private var interactor: DetailInteractor!
    
    private var viewData: DetailViewData!
    
    private let request = DetailRequest(url: "https://rickandmortyapi.com/api/character/1")
    
    override func setUp() {
        self.setupTests()
        self.setupViewData()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func setupTests() {
        self.dataBaseMock = DetailDataBaseMock()
        self.serviceMock = DetailServiceMock()
        self.controllerMock = DetailViewControllerMock()
        self.presenterMock = DetailPresenter(view: self.controllerMock)
        self.interactor = DetailInteractor(worker: self.serviceMock, presenter: self.presenterMock, favoriteDataBase: dataBaseMock)
    }
    
    private func setupViewData() {
        let origin = LocationElementViewData(valueName: "Earth (C-137)", valueType: "Planet", valueDimension: "Dimension C-137")
        let location = LocationElementViewData(valueName: "Earth (Replacement Dimension)", valueType: "Planet", valueDimension: "Replacement Dimension")
        self.viewData = DetailViewData(id: 1, name: "Rick Sanchez", urlBanner: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", originElement: origin, locationElement: location, enableFavorite: false, urlDetail: "https://rickandmortyapi.com/api/character/1")
    }

}

// MARK: - SUCCESS TESTS -
extension DetailPresenterTests {
    
    func test_success_detail_and_location_and_origin() {
        self.serviceMock.fileName = JsonName.DETAIL_SUCCESS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.success, "Error - StateView different from success")
            XCTAssertNotNil(self.controllerMock.viewData, "Error - viewData nil")
            XCTAssertNotNil(self.controllerMock.viewData?.locationElement, "Error - locationElement nil")
            XCTAssertNotNil(self.controllerMock.viewData?.originElement, "Error - originElement nil")
        }
    }
    
    func test_success_response() {
        self.serviceMock.fileName = JsonName.DETAIL_SUCCESS
        self.interactor.getDetail(request: self.request)
        XCTAssertTrue(self.controllerMock.calledShowLoading)
        self.wait {
            
            guard let viewData = self.controllerMock.viewData else { XCTFail(); return }
            
            XCTAssertEqual(viewData.id, self.viewData.id, "Error - creating id")
            XCTAssertEqual(viewData.name, self.viewData.name, "Error - creating name")
            XCTAssertEqual(viewData.urlBanner, self.viewData.urlBanner, "Error - creating urlImage")
            XCTAssertEqual(viewData.enableFavorite, self.viewData.enableFavorite, "Error - creating isFavorite")
            XCTAssertEqual(viewData.urlDetail, self.viewData.urlDetail, "Error - creating urlDetail")
            
            XCTAssertEqual(viewData.originElement.titleName, self.viewData.originElement.titleName, "Error - creating origin titleName")
            XCTAssertEqual(viewData.originElement.valueName, self.viewData.originElement.valueName, "Error - creating origin valueName")
            XCTAssertEqual(viewData.originElement.titleType, self.viewData.originElement.titleType, "Error - creating origin titleType")
            XCTAssertEqual(viewData.originElement.valueType, self.viewData.originElement.valueType, "Error - creating origin valueType")
            XCTAssertEqual(viewData.originElement.titleDimension, self.viewData.originElement.titleDimension, "Error - creating origin titleDimension")
            XCTAssertEqual(viewData.originElement.valueDimension, self.viewData.originElement.valueDimension, "Error - creating origin valueDimension")
            
            XCTAssertEqual(viewData.locationElement.titleName, self.viewData.locationElement.titleName, "Error - creating location titleName")
            XCTAssertEqual(viewData.locationElement.valueName, self.viewData.locationElement.valueName, "Error - creating location valueName")
            XCTAssertEqual(viewData.locationElement.titleType, self.viewData.locationElement.titleType, "Error - creating location titleType")
            XCTAssertEqual(viewData.locationElement.valueType, self.viewData.locationElement.valueType, "Error - creating location valueType")
            XCTAssertEqual(viewData.locationElement.titleDimension, self.viewData.locationElement.titleDimension, "Error - creating location titleDimension")
            XCTAssertEqual(viewData.locationElement.valueDimension, self.viewData.locationElement.valueDimension, "Error - creating location valueDimension")
        }
    }
}

// MARK: - ERROR TESTS -
extension DetailPresenterTests {
    
    func test_error_generic() {
        self.serviceMock.statusService = .error(.genericError)
        self.serviceMock.fileName = JsonName.DETAIL_SUCCESS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
        }
    }
    
    func test_error_empty_detail() {
        self.serviceMock.fileName = JsonName.DETAIL_EMPTY
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.controllerMock.viewData, "Error - response different from nil")
        }
    }
    
    func test_error_detail_with_origin_empty() {
        self.serviceMock.fileName = JsonName.DETAIL_WITH_ORIGIN_EMPTY
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
        }
    }
    
    func test_error_detail_with_location_empty() {
        self.serviceMock.fileName = JsonName.DETAIL_WITH_LOCATION_EMPTY
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
        }
    }
    
    func test_error_in_serialization() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.DETAIL_ERROR_JSON_STRUCTURE
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
        }
    }
    
    func test_error_required_fields_in_detail() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.DETAIL_ERROR_REQUIRED_FIELDS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
        }
    }
    
    func test_error_required_fields_in_origin() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.DETAIL_WITH_ORIGIN_ERROR_REQUIRED_FIELDS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
        }
    }
    
    func test_error_required_fields_in_location() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.DETAIL_WITH_ORIGIN_ERROR_REQUIRED_FIELDS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
        }
    }
}
