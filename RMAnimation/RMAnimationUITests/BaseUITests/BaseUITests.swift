//
//  BaseUITests.swift
//  RMAnimationUITests
//
//  Created by Gilson Santos on 13/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import XCTest

class BaseUITests: XCTestCase {

    // MARK: - CONSTANTS -
    let app = XCUIApplication()

}

// MARK: - SETUP AND TEARDOWN -
extension BaseUITests {
    override func setUp() {
        app.launchArguments.append("--UITests")
        self.continueAfterFailure = false
        super.setUp()
    }
    
    override func tearDown() {
        self.app.terminate()
        super.tearDown()
    }
}

// MARK: - MANAGER TEST STEPS -
extension BaseUITests {
    func afterLaunchingTheApp() {
        XCTContext.runActivity(named: "Após iniciar o aplicativo") { _ in
            self.app.launch()
        }
    }
}

// MARK: - VIEW TEST STEPS -
extension BaseUITests {
    func iSeeTheScreen(identifier: String) {
        XCTContext.runActivity(named: "Vejo a tela \(identifier)") { _ in
            let resultView = self.app.otherElements[identifier]
            let viewExists = resultView.waitForExistence(timeout: 10)
            XCTAssert(viewExists)
        }
    }
    
    func iTouchTheView(identifier: String) {
        XCTContext.runActivity(named: "Vejo a view \(identifier)") { _ in
            let resultView = self.app.otherElements[identifier]
            resultView.tap()
        }
    }
}

// MARK: - SEE LABEL -
extension BaseUITests {
    func iSeeTheLabel(identifier: String, withValue: String? = nil) {
        XCTContext.runActivity(named: "Vejo a Label \(identifier)") { _ in
            let resultView = self.app.staticTexts[identifier]
            let viewExists = resultView.waitForExistence(timeout: 10)
            if let valueForComparable = withValue {
                XCTAssertEqual(resultView.label, valueForComparable)
            }
            XCTAssert(viewExists)
        }
    }
}

// MARK: - BUTTON TEST STEPS -
extension BaseUITests {
    func iSeeTheButton(identifier: String) {
        XCTContext.runActivity(named: "Vejo o botão \(identifier)") { _ in
            XCTAssert(self.app.buttons[identifier].exists)
        }
    }
    
    func iTouchTheButton(identifier: String) {
        XCTContext.runActivity(named: "Toco no botão \(identifier)") { _ in
            self.app.buttons[identifier].tap()
        }
    }
}

// MARK: - TABLEVIEW TEST STEPS -
extension BaseUITests {
    func iSeeTheCell(identifier: String) {
        XCTContext.runActivity(named: "Vejo a célula \(identifier)") { _ in
            let tablesQuery = self.app.tables
            let resultCell = tablesQuery.cells[identifier]
            let viewExists = resultCell.waitForExistence(timeout: 10)
            XCTAssert(viewExists)
        }
    }
    
    func iSelectTheCell(identifier: String) {
        XCTContext.runActivity(named: "Seleciono a célula \(identifier)") { _ in
            self.app.tables.cells[identifier].tap()
        }
    }
}

// MARK: - NAVIGATION CONTROLLER STEPS -
extension BaseUITests {
    func iSeeScreenTitle(title: String) {
        XCTContext.runActivity(named: "Vejo o titúlo \(title)") { _ in
            XCTAssert(self.app.staticTexts[title].exists)
        }
    }
}

