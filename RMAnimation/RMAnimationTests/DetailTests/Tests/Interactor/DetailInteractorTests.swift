//
//  DetailInteractorTests.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 11/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import XCTest
@testable import RMAnimation

class DetailInteractorTests: XCTestCase {

    private var serviceMock: DetailServiceMock!
    private var presenterMock: DetailPresenterMock!
    private var controllerMock: DetailViewControllerMock!
    private var dataBaseMock: FavoriteDataBaseProtocol!
    private var interactor: DetailInteractor!
    
    private var response: DetailResponse!
    private var favoriteResponse: FavoriteRequestResponse!
    
    private let request = DetailRequest(url: "https://rickandmortyapi.com/api/character/1")
    
    override func setUp() {
        self.setupTests()
        self.setupResponse()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func setupTests() {
        self.dataBaseMock = DetailDataBaseMock()
        self.serviceMock = DetailServiceMock()
        self.controllerMock = DetailViewControllerMock()
        self.presenterMock = DetailPresenterMock(view: self.controllerMock)
        self.interactor = DetailInteractor(worker: self.serviceMock, presenter: self.presenterMock, favoriteDataBase: dataBaseMock)
        self.favoriteResponse = FavoriteRequestResponse(id: 1, name: "Rick Sanchez", creationDate: "04/11/2017", imageUrl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", urlDetail: "https://rickandmortyapi.com/api/character/1")
    }
    
    private func setupResponse() {
        let origin = LocationResponse(id: 1, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137")
        let location = LocationResponse(id: 20, name: "Earth (Replacement Dimension)", type: "Planet", dimension: "Replacement Dimension")
        self.response = DetailResponse(id: 1, name: "Rick Sanchez", urlImage: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", urlOrigin: "origin_success", urlLocation: "location_success", origin: origin, location: location, isFavorite: false, urlDetail: "https://rickandmortyapi.com/api/character/1")
    }

}

// MARK: - SUCCESS TESTS -
extension DetailInteractorTests {
    func test_success_detail_and_location_and_origin() {
        self.serviceMock.fileName = JsonName.DETAIL_SUCCESS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.success, "Error - StateView different from success")
            XCTAssertNotNil(self.presenterMock.response, "Error - response nil")
            XCTAssertNotNil(self.presenterMock.response?.location, "Error - location nil")
            XCTAssertNotNil(self.presenterMock.response?.origin, "Error - origin nil")
        }
    }
    
    func test_success_response() {
        self.serviceMock.fileName = JsonName.DETAIL_SUCCESS
        self.interactor.getDetail(request: self.request)
        XCTAssertTrue(self.presenterMock.calledStartRequest)
        self.wait {
            
            guard let response = self.presenterMock.response else { XCTFail(); return }
            
            XCTAssertEqual(response.id, self.response.id, "Error - creating id")
            XCTAssertEqual(response.name, self.response.name, "Error - creating name")
            XCTAssertEqual(response.urlImage, self.response.urlImage, "Error - creating urlImage")
            XCTAssertEqual(response.urlOrigin, self.response.urlOrigin, "Error - creating urlOrigin")
            XCTAssertEqual(response.urlLocation, self.response.urlLocation, "Error - creating urlLocation")
            XCTAssertEqual(response.isFavorite, self.response.isFavorite, "Error - creating isFavorite")
            XCTAssertEqual(response.urlDetail, self.response.urlDetail, "Error - creating urlDetail")
            
            XCTAssertEqual(response.origin.id, self.response.origin.id, "Error - creating origin id")
            XCTAssertEqual(response.origin.name, self.response.origin.name, "Error - creating origin name")
            XCTAssertEqual(response.origin.type, self.response.origin.type, "Error - creating origin type")
            XCTAssertEqual(response.origin.dimension, self.response.origin.dimension, "Error - creating origin dimension")
            
            XCTAssertEqual(response.location.id, self.response.location.id, "Error - creating location id")
            XCTAssertEqual(response.location.name, self.response.location.name, "Error - creating location name")
            XCTAssertEqual(response.location.type, self.response.location.type, "Error - creating location type")
            XCTAssertEqual(response.location.dimension, self.response.location.dimension, "Error - creating location dimension")
        }
    }
    
    func test_success_add_and_fetch_and_remove_in_dataBase() {
        self.serviceMock.fileName = JsonName.DETAIL_SUCCESS
        self.interactor.addOrRemoveFavorite(request: self.favoriteResponse)
        XCTAssertNotNil(self.dataBaseMock.fetchFavoriteList(), "Error - database nil")
        XCTAssertEqual(self.dataBaseMock.fetchFavoriteList()?.count, 1, "Error - database count")
        self.interactor.getDetail(request: self.request)
        self.wait {
            guard let response = self.presenterMock.response else { XCTFail(); return }
            XCTAssertTrue(response.isFavorite)
        }
    }
}

// MARK: - ERROR TESTS -
extension DetailInteractorTests {
    
    func test_error_generic() {
        self.serviceMock.statusService = .error(.genericError)
        self.serviceMock.fileName = JsonName.DETAIL_SUCCESS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
        }
    }
    
    func test_error_empty_detail() {
        self.serviceMock.fileName = JsonName.DETAIL_EMPTY
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
        }
    }
    
    func test_error_detail_with_origin_empty() {
        self.serviceMock.fileName = JsonName.DETAIL_WITH_ORIGIN_EMPTY
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
        }
    }
    
    func test_error_detail_with_location_empty() {
        self.serviceMock.fileName = JsonName.DETAIL_WITH_LOCATION_EMPTY
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
        }
    }
    
    func test_error_in_serialization() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.DETAIL_ERROR_JSON_STRUCTURE
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
        }
    }
    
    func test_error_required_fields_in_detail() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.DETAIL_ERROR_REQUIRED_FIELDS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
        }
    }
    
    func test_error_required_fields_in_origin() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.DETAIL_WITH_ORIGIN_ERROR_REQUIRED_FIELDS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
        }
    }
    
    func test_error_required_fields_in_location() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.DETAIL_WITH_ORIGIN_ERROR_REQUIRED_FIELDS
        self.interactor.getDetail(request: self.request)
        self.wait {
            XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
            XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
        }
    }
    
}
