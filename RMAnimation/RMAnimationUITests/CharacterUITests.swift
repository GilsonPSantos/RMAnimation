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
    
    private var buttonAddFavorite: XCUIElement!
    private var tabbarItemFavorite: XCUIElement!
    private var tabbarItemHome: XCUIElement!
    private var favoriteTableView: XCUIElement!
    private var labelMessageEmptyFavorite: XCUIElement!
    
    private let titleName = "Name"
    private let titleType = "Type"
    private let titleDimension = "Dimension"
    

    override func setUp() {
        self.app.launchArguments.append("--UITests")
        self.setupElements()
        self.afterLaunchingTheApp()
        super.setUp()
    }
    
    private func setupElements() {
        self.homeTableView = self.app.tables[Identifiers.homeTableView]
        self.favoriteTableView = self.app.tables[Identifiers.favoriteTableView]
        self.firstHomeCell = self.homeTableView.cells[Identifiers.homeTableViewCell + "0"]
        
        self.imageCharacter = self.firstHomeCell.images[Identifiers.imageCharacter]
        self.imageArrow = self.firstHomeCell.images[Identifiers.imageArrowCharacter]
        
        self.labelName = self.firstHomeCell.staticTexts[Identifiers.labelNameCharacter]
        self.labelCreationDate = self.firstHomeCell.staticTexts[Identifiers.labelDateCharacter]
        
        self.imageBanner = self.app.images[Identifiers.imageBannerDetail]
        self.labelTitleNameOrigin = app.staticTexts[Identifiers.labelTitleNameDetail + "origin"]
        self.labelValueNameOrigin = app.staticTexts[Identifiers.labelNameDetail + "origin"]
        
        self.labelTitleTypeOrigin = app.staticTexts[Identifiers.labelTitleTypeDetail + "origin"]
        self.labelValueTypeOrigin = app.staticTexts[Identifiers.labelTypeDetail + "origin"]
        
        self.labelTitleDimensionOrigin = app.staticTexts[Identifiers.labelTitleDimensionDetail + "origin"]
        self.labelValueDimensionOrigin = app.staticTexts[Identifiers.labelDimensionDetail + "origin"]
                
        self.labelTitleNameLocation = app.staticTexts[Identifiers.labelTitleNameDetail + "location"]
        self.labelValueNameLocation = app.staticTexts[Identifiers.labelNameDetail + "location"]
        
        self.labelTitleTypeLocation = app.staticTexts[Identifiers.labelTitleTypeDetail + "location"]
        self.labelValueTypeLocation = app.staticTexts[Identifiers.labelTypeDetail + "location"]
        
        self.labelTitleDimensionLocation = app.staticTexts[Identifiers.labelTitleDimensionDetail + "location"]
        self.labelValueDimensionLocation = app.staticTexts[Identifiers.labelDimensionDetail + "location"]
        
        self.buttonAddFavorite = self.app.buttons[Identifiers.buttonAddFavorite]
        self.tabbarItemFavorite = self.app.tabBars.buttons[Identifiers.tabbarFavoriteItem]
        self.tabbarItemHome = self.app.tabBars.buttons[Identifiers.tabbarHomeItem]
        self.labelMessageEmptyFavorite = self.app.staticTexts[Identifiers.labelMessageEmpty]
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
        XCTAssertTrue(self.imageBanner.exists)
        XCTAssertEqual(self.labelTitleNameOrigin.label, self.titleName)
        XCTAssertEqual(self.labelValueNameOrigin.label, "Earth (C-137)")
        
        XCTAssertEqual(self.labelTitleTypeOrigin.label, self.titleType)
        XCTAssertEqual(self.labelValueTypeOrigin.label, "Planet")
        
        XCTAssertEqual(self.labelTitleDimensionOrigin.label, self.titleDimension)
        XCTAssertEqual(self.labelValueDimensionOrigin.label, "Dimension C-137")
        
        XCTAssertEqual(self.labelTitleNameLocation.label, self.titleName)
        XCTAssertEqual(self.labelValueNameLocation.label, "Earth (Replacement Dimension)")
        
        XCTAssertEqual(self.labelTitleTypeLocation.label, self.titleType)
        XCTAssertEqual(self.labelValueTypeLocation.label, "Planet")
        
        XCTAssertEqual(self.labelTitleDimensionLocation.label, self.titleDimension)
        XCTAssertEqual(self.labelValueDimensionLocation.label, "Replacement Dimension")
    }
    
    func test_add_and_remove_favorite() {
        self.firstHomeCell.tap()
        self.buttonAddFavorite.tap()
        self.app.navigationBars.buttons.element(boundBy: 0).tap()
        self.tabbarItemFavorite.tap()
        if self.favoriteTableView.waitForExistence(timeout: 3) {
            XCTAssertEqual(self.favoriteTableView.cells.count, 1)
            self.removeFavorite()
        } else {
            XCTFail()
        }
    }
    
    private func removeFavorite() {
        self.tabbarItemHome.tap()
        self.firstHomeCell.tap()
        self.buttonAddFavorite.tap()
        self.app.navigationBars.buttons.element(boundBy: 0).tap()
        self.tabbarItemFavorite.tap()
        XCTAssertTrue(self.labelMessageEmptyFavorite.exists)
        XCTAssertEqual(self.labelMessageEmptyFavorite.label, "Você não possui favoritos!")
    }
    
}
