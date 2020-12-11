//
//  HomeViewControllerTests.swift
//  RMAnimationTests
//
//  Created by Gilson Santos on 09/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import XCTest
@testable import RMAnimation

class HomeViewControllerTests: XCTestCase {

    private var serviceMock: HomeServiceMock!
    private var controller: HomeViewController!
    private var interactorMock: HomeInteractorMock!
    private var presenter: HomePresenter!
    
    private var viewData: HomeViewData!
    private var firstCharacterViewData: CharacterViewData!
    private let request = HomeRequest(url: "https://rickandmortyapi.com/api/character?page=1")
    
     var window: UIWindow!

    override func setUp() {
        self.window = UIWindow()
        self.setupTests()
        self.setupViewData()
        self.setupComponents()
        super.setUp()
    }
    
    override func tearDown() {
//        self.window = nil
        super.tearDown()
    }
    
    private func loadView() {
        self.window.addSubview(self.controller.view)
        RunLoop.current.run(until: Date())
    }
    
    private func setupTests() {
        self.serviceMock = HomeServiceMock()
        self.controller = HomeViewController()
        self.presenter = HomePresenter(view: self.controller)
        self.interactorMock = HomeInteractorMock(worker: self.serviceMock, presenter: self.presenter)
        self.controller.interactor = self.interactorMock
    }
    
    private func setupViewData() {
        let characterViewData = CharacterViewData(id: 1, name: "Rick Sanchez", creationDate: "Criado em 04/11/2017", imageUrl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", urlDetail: "https://rickandmortyapi.com/api/character/1")
        self.viewData = HomeViewData(isFinish: false, nextPage: "https://rickandmortyapi.com/api/character?page=2", characters: [characterViewData], isPaginator: true)
        self.firstCharacterViewData = characterViewData
    }
    
    private func setupComponents() {
    }

}

// MARK: - SUCCESS TESTS -
extension HomeViewControllerTests {
    
    func test_called_getCharacter_in_the_didload() {
       self.serviceMock.fileName = JsonName.CHARACTER_LIST_SUCCESS
        self.loadView()
        XCTAssertTrue(self.interactorMock.calledgetCharacter)
    }
}

// MARK: - ERROR TESTS -
extension HomeViewControllerTests {
    
}
