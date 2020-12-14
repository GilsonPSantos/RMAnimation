//
//  CharacterUITests.swift
//  RMAnimationUITests
//
//  Created by Gilson Santos on 13/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import XCTest

class CharacterUITests: BaseUITests {
    
    private let titleHomeScreen = "Lista de Personagens"
    
    private var homeTableView: XCUIElement!
    private var firstHomeCell: XCUIElement!
    private var imageCharacter: XCUIElement!
    private var imageArrow: XCUIElement!
    private var labelName: XCUIElement!
    private var labelCreationDate: XCUIElement!
    
    private var imageBanner: XCUIElement!
    
    private var labelTitleNameOrigin: XCUIElement!
    private var labelValueNameOrigin: XCUIElement!
    private var labelTitleTypeOrigin: XCUIElement!
    private var labelValueTypeOrigin: XCUIElement!
    private var labelTitleDimensionOrigin: XCUIElement!
    private var labelValueDimensionOrigin: XCUIElement!
    
    private var labelTitleNameLocation: XCUIElement!
    private var labelValueNameLocation: XCUIElement!
    private var labelTitleTypeLocation: XCUIElement!
    private var labelValueTypeLocation: XCUIElement!
    private var labelTitleDimensionLocation: XCUIElement!
    private var labelValueDimensionLocation: XCUIElement!
    

    override func setUp() {
        self.setupElements()
        self.afterLaunchingTheApp()
        super.setUp()
    }
    
    private func setupElements() {
        self.homeTableView = self.app.tables[Identifiers.homeTableView]
        self.firstHomeCell = self.homeTableView.cells[Identifiers.homeTableViewCell + "0"]
        
        self.imageCharacter = self.firstHomeCell.images[Identifiers.imageCharacter]
        self.imageArrow = self.firstHomeCell.images[Identifiers.imageArrowCharacter]
        
        self.labelName = self.firstHomeCell.staticTexts[Identifiers.labelNameCharacter]
        self.labelCreationDate = self.firstHomeCell.staticTexts[Identifiers.labelDateCharacter]
        
        self.imageBanner = self.app.images[Identifiers.imageBannerDetail]
        self.labelTitleNameOrigin = app.staticTexts[Identifiers.labelTitleNameDetail]
        self.labelValueNameOrigin = app.staticTexts[Identifiers.labelNameDetail]
        
        self.labelTitleTypeOrigin = app.staticTexts[Identifiers.labelTitleTypeDetail]
        self.labelValueTypeOrigin = app.staticTexts[Identifiers.labelTypeDetail]
        
        
    }

}

extension CharacterUITests {
    
    func test_see_list_screen() {
        self.iSeeScreenTitle(title: self.titleHomeScreen)
    }
    
    func test_see_list_count() {
        if self.homeTableView.waitForExistence(timeout: 3) {
            XCTAssertEqual(self.homeTableView.cells.count, 20)
        } else {
            XCTFail()
        }
    }
    
    func test_see_elements_first_cell_home() {
        XCTAssertEqual(self.labelName.label, "Rick Sanchez")
        XCTAssertEqual(self.labelCreationDate.label, "Criado em 04/11/2017")
        XCTAssertTrue(self.imageCharacter.exists)
        XCTAssertTrue(self.imageArrow.exists)
    }
    
    func test_see_detail_screen() {
        self.firstHomeCell.tap()
        self.iSeeScreenTitle(title: self.labelName.label)
    }
    
    func test_see_elements_detail_screen() {
        self.firstHomeCell.tap()
//        XCTAssertEqual(self.labelName.label, "Rick Sanchez")
//        XCTAssertEqual(self.labelCreationDate.label, "Criado em 04/11/2017")
        XCTAssertTrue(self.imageBanner.exists)
//        XCTAssertTrue(self.imageArrow.exists)
    }
    
}
