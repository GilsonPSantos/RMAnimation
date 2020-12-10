//
//  HomeInteractorTests.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 09/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import XCTest
@testable import RMAnimation

class HomeInteractorTests: XCTestCase {
    
    private var serviceMock: HomeServiceMock!
    private var presenterMock: HomePresenterMock!
    private var controllerMock: HomeViewControllerMock!
    private var interactor: HomeInteractor!
    
    private var lastResponse: HomeResponse!
    private var lastCharacterInResponse: CharacterResponse!
    private let request = HomeRequest(url: "https://rickandmortyapi.com/api/character?page=1")
    
    override func setUp() {
        self.setupTests()
        self.setupResponse()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func setupTests() {
        self.serviceMock = HomeServiceMock()
        self.controllerMock = HomeViewControllerMock()
        self.presenterMock = HomePresenterMock(view: self.controllerMock)
        self.interactor = HomeInteractor(worker: self.serviceMock, presenter: self.presenterMock)
    }
    
    private func setupResponse() {
        var response = HomeResponse(pages: 34, count: 671, nextPage: "https://rickandmortyapi.com/api/character?page=2", isLastPage: false)
        let character = CharacterResponse(id: 7, name: "Abradolf Lincler", creationDate: "2017-11-04T19:59:20.523Z".stringToDate()!, urlImage: "https://rickandmortyapi.com/api/character/avatar/7.jpeg", urlDetail: "https://rickandmortyapi.com/api/character/7")
        response.characters.append(character)
        self.lastResponse = response
        self.lastCharacterInResponse = character
    }
}

// MARK: - SUCCESS TESTS -
extension HomeInteractorTests {
    func test_success_list() {
        self.serviceMock.fileName = JsonName.CHARACTER_LIST_SUCCESS
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.presenterMock.stateView, StateView.success, "Error - StateView different from success")
        XCTAssertNotNil(self.presenterMock.response, "Error - response nil")
        XCTAssertEqual(self.presenterMock.response?.characters.count, 7, "Error - response count")
    }
    
    func test_success_response() {
        self.serviceMock.fileName = JsonName.CHARACTER_LIST_SUCCESS
        self.interactor.getCharacter(request: self.request)
        guard let response = self.presenterMock.response,
            let lastCharacterInService = self.presenterMock.response?.characters.last else { XCTFail(); return }
        
        XCTAssertEqual(response.count, self.lastResponse.count, "Error - creating count")
        XCTAssertEqual(response.nextPage, self.lastResponse.nextPage, "Error - creating nextPage")
        XCTAssertEqual(response.pages, self.lastResponse.pages, "Error - creating pages")
        XCTAssertEqual(response.isLastPage, self.lastResponse.isLastPage, "Error - creating isLastPage")
        
        XCTAssertEqual(lastCharacterInService.id, self.lastCharacterInResponse.id, "Error - creating id")
        XCTAssertEqual(lastCharacterInService.name, self.lastCharacterInResponse.name, "Error - creating name")
        XCTAssertEqual(lastCharacterInService.creationDate, self.lastCharacterInResponse.creationDate, "Error - creating creationDate")
        XCTAssertEqual(lastCharacterInService.urlImage, self.lastCharacterInResponse.urlImage, "Error - creating urlImage")
        XCTAssertEqual(lastCharacterInService.urlDetail, self.lastCharacterInResponse.urlDetail, "Error - creating urlDetail")
    }
    
    func test_success_with_only_one_valid_element_in_the_list() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.CHARACTER_SUCCESS_ONLY_ONE_ELEMENT_VALID
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.presenterMock.stateView, StateView.success, "Error - StateView different from success")
        XCTAssertNotNil(self.presenterMock.response, "Error - response nil")
        XCTAssertEqual(self.presenterMock.response?.characters.count, 1, "Error - response count")
        XCTAssertEqual(self.presenterMock.response?.characters.first?.id, 1, "Error - id invalid")
    }
}

// MARK: - ERROR TESTS -
extension HomeInteractorTests {
    
    func test_error_generic() {
        self.serviceMock.statusService = .error(.genericError)
        self.serviceMock.fileName = JsonName.CHARACTER_LIST_SUCCESS
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
        XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
    }
    
    func test_error_empty_list() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.CHARACTER_EMPTY_LIST
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
        XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
    }
    
    func test_error_in_serialization() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.CHARACTER_ERROR_JSON_STRUCTURE
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
        XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
    }
    
    func test_error_required_fields() {
        self.serviceMock.statusService = .success
        self.serviceMock.fileName = JsonName.CHARACTER_ERROR_REQUIRED_FIELDS
        self.interactor.getCharacter(request: self.request)
        XCTAssertEqual(self.presenterMock.stateView, StateView.error, "Error - StateView different from error")
        XCTAssertNil(self.presenterMock.response, "Error - response different from nil")
    }
}
