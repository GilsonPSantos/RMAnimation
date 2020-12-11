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
    
    private var lastResponse: DetailResponse!
    
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
    }
    
    private func setupResponse() {
        
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
}

// MARK: - ERROR TESTS -
extension DetailInteractorTests {
    
}
