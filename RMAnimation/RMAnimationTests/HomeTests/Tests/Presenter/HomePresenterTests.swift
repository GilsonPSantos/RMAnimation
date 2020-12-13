//
//  HomePresenterTests.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 09/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import XCTest
@testable import RMAnimation

class HomePresenterTests: XCTestCase {
    
    private var serviceMock: HomeServiceMock!
    private var controllerMock: HomeViewControllerMock!
    private var interactor: HomeInteractor!
    private var presenter: HomePresenter!
    
    private var viewData: HomeViewData!
    private var firstCharacterViewData: CharacterViewData!
    private let request = HomeRequest(url: "https://rickandmortyapi.com/api/character?page=1")

    override func setUp() {
        self.setupTests()
        self.setupViewData()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func setupTests() {
        self.serviceMock = HomeServiceMock()
        self.controllerMock = HomeViewControllerMock()
        self.presenter = HomePresenter(view: self.controllerMock)
        self.interactor = HomeInteractor(worker: self.serviceMock, presenter: self.presenter)
    }
    
    private func setupViewData() {
        let characterViewData = CharacterViewData(id: 1, name: "Rick Sanchez", creationDate: "Criado em 04/11/2017", imageUrl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", urlDetail: "https://rickandmortyapi.com/api/character/1")
        self.viewData = HomeViewData(isFinish: false, nextPage: "https://rickandmortyapi.com/api/character?page=2", characters: [characterViewData], isPaginator: true)
        self.firstCharacterViewData = characterViewData
    }

}

// MARK: - SUCCESS TESTS -
extension HomePresenterTests {
    
    func test_success_list() {
        self.serviceMock.fileName = JsonName.CHARACTER_LIST_SUCCESS
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.controllerMock.stateView, StateView.success, "Error - StateView different from success")
        XCTAssertNotNil(self.controllerMock.viewData, "Error - viewData nil")
        XCTAssertEqual(self.controllerMock.viewData?.characters.count, 7, "Error - viewData count")
    }
    
    func test_success_viewData() {
        self.serviceMock.fileName = JsonName.CHARACTER_LIST_SUCCESS
        self.interactor.getCharacter(request: self.request)
        XCTAssertTrue(self.controllerMock.calledShowLoading)
        guard let viewData = self.controllerMock.viewData,
            let firstCharacterInService = self.controllerMock.viewData?.characters.first else { XCTFail(); return }
        
        XCTAssertEqual(viewData.nextPage, self.viewData.nextPage, "Error - creating nextPage")
        XCTAssertEqual(viewData.isPaginator, self.viewData.isPaginator, "Error - creating isPaginator")
        XCTAssertEqual(viewData.isFinish, self.viewData.isFinish, "Error - creating isFinish")
        
        XCTAssertEqual(firstCharacterInService.id, self.firstCharacterViewData.id, "Error - creating id")
        XCTAssertEqual(firstCharacterInService.name, self.firstCharacterViewData.name, "Error - creating name")
        XCTAssertEqual(firstCharacterInService.creationDate, self.firstCharacterViewData.creationDate, "Error - creating creationDate")
        XCTAssertEqual(firstCharacterInService.imageUrl, self.firstCharacterViewData.imageUrl, "Error - creating imageUrl")
        XCTAssertEqual(firstCharacterInService.urlDetail, self.firstCharacterViewData.urlDetail, "Error - creating urlDetail")
    }
    
    func test_success_with_only_one_valid_element_in_the_list() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.CHARACTER_SUCCESS_ONLY_ONE_ELEMENT_VALID
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.controllerMock.stateView, StateView.success, "Error - StateView different from success")
        XCTAssertNotNil(self.controllerMock.viewData, "Error - viewData nil")
        XCTAssertEqual(self.controllerMock.viewData?.characters.count, 1, "Error - viewData count")
        XCTAssertEqual(self.controllerMock.viewData?.characters.first?.id, 1, "Error - id invalid")
    }
}

// MARK: - ERROR TESTS -
extension HomePresenterTests {
    
    func test_error_generic() {
        self.serviceMock.statusService = .error(.genericError)
        self.serviceMock.fileName = JsonName.CHARACTER_LIST_SUCCESS
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
        XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
    }
    
    func test_error_empty_list() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.CHARACTER_EMPTY_LIST
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
        XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
    }
    
    func test_error_in_serialization() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.CHARACTER_ERROR_JSON_STRUCTURE
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
        XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
    }
    
    func test_error_required_fields() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.CHARACTER_ERROR_REQUIRED_FIELDS
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.controllerMock.stateView, StateView.error, "Error - StateView different from error")
        XCTAssertNil(self.controllerMock.viewData, "Error - viewData different from nil")
    }
    
}
