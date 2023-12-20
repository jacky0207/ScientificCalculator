//
//  HomeUITester.swift
//  ScientificCalculatorUITests
//
//  Created by Jacky Lam on 2023-12-19.
//

import XCTest

class HomeUITester: UITester {
    var app: XCUIApplication
    lazy var root: XCUIElement = app.otherElements["Home"]
    lazy var calculator = root.otherElements["calculator"]
    lazy var calculatorDisplayScreen = root.otherElements["calculatorDisplayScreen"]
    lazy var calculatorDisplayScreenEquation = root.staticTexts["calculatorDisplayScreenEquation"]
    lazy var calculatorDisplayScreenHistoryLog = root.staticTexts["calculatorDisplayScreenHistoryLog"].firstMatch
    lazy var calculatorControlPanel = root.otherElements["calculatorControlPanel"]
    func calculatorButton(for identifier: String) -> XCUIElement {
        return calculatorControlPanel.buttons["calculatorButton-\(identifier)"]
    }

    required init(app: XCUIApplication) {
        self.app = app
        self.app.launchArguments = ["testing"]
    }
    
    func reset() {
        app.launch()
    }
    
    func enterPage() {
        // default page
    }
    
    func isEnteredPage() -> Bool {
        return root.waitForExistence(timeout: 0.5)
    }
}
