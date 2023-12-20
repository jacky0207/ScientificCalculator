//
//  HomeUITests.swift
//  HomeUITests
//
//  Created by Jacky Lam on 2023-11-17.
//

import XCTest

final class HomeUITests: XCTestCase {
    let tester = HomeUITester(app: XCUIApplication())

    override func setUpWithError() throws {
        continueAfterFailure = false
        tester.reset()
        tester.enterPage()
    }

    override func tearDownWithError() throws {

    }

    func testHome_ComponentExist() throws {
        XCTAssertTrue(tester.isEnteredPage())
        XCTAssertTrue(tester.calculator.waitForExistence(timeout: 0.5))
        XCTAssertTrue(tester.calculatorDisplayScreen.waitForExistence(timeout: 0.5))
        XCTAssertTrue(tester.calculatorControlPanel.waitForExistence(timeout: 0.5))
        XCTAssertTrue(tester.calculatorButton(for: "1").waitForExistence(timeout: 0.5))
    }

    func testHome_Delete() throws {
        XCTAssertTrue(tester.isEnteredPage())
        tester.calculatorButton(for: "1").tap()
        tester.calculatorButton(for: "2").tap()
        tester.calculatorButton(for: "DEL").tap()
        XCTAssertEqual(tester.calculatorDisplayScreenEquation.label, "1")
    }

    func testHome_AllClear() throws {
        XCTAssertTrue(tester.isEnteredPage())
        tester.calculatorButton(for: "1").tap()
        tester.calculatorButton(for: "2").tap()
        tester.calculatorButton(for: "AC").tap()
        XCTAssertFalse(tester.calculatorDisplayScreenEquation.waitForExistence(timeout: 0.5))
    }

    func testHome_BasicCalculation() throws {
        XCTAssertTrue(tester.isEnteredPage())
        tester.calculatorButton(for: "1").tap()
        tester.calculatorButton(for: "+").tap()
        tester.calculatorButton(for: "2").tap()
        tester.calculatorButton(for: "EXE").tap()
        XCTAssertEqual(tester.calculatorDisplayScreenEquation.label, "1+2")
        XCTAssertEqual(tester.calculatorDisplayScreenHistoryLog.label, "1+2=3")
    }

    func testHome_FunctionCalculation() throws {
        XCTAssertTrue(tester.isEnteredPage())
        tester.calculatorButton(for: "sin").tap()
        tester.calculatorButton(for: "3").tap()
        tester.calculatorButton(for: "0").tap()
        tester.calculatorButton(for: "EXE").tap()
        XCTAssertEqual(tester.calculatorDisplayScreenEquation.label, "sin30")
        XCTAssertEqual(tester.calculatorDisplayScreenHistoryLog.label, "sin30=0.5")
    }

    func testHome_FunctionSwitch() throws {
        XCTAssertTrue(tester.isEnteredPage())
        tester.calculatorButton(for: "Fn").tap()
        tester.calculatorButton(for: "√").tap()
        tester.calculatorButton(for: "9").tap()
        tester.calculatorButton(for: "EXE").tap()
        XCTAssertEqual(tester.calculatorDisplayScreenEquation.label, "√9")
        XCTAssertEqual(tester.calculatorDisplayScreenHistoryLog.label, "√9=3")
    }

    func testHome_SaveToVariable() throws {
        XCTAssertTrue(tester.isEnteredPage())
        tester.calculatorButton(for: "sin").tap()
        tester.calculatorButton(for: "3").tap()
        tester.calculatorButton(for: "0").tap()
        tester.calculatorButton(for: "STO").tap()
        tester.calculatorButton(for: "->a").tap()
        XCTAssertEqual(tester.calculatorDisplayScreenEquation.label, "sin30")
        XCTAssertEqual(tester.calculatorDisplayScreenHistoryLog.label, "sin30=0.5->a")
    }

    func testHome_AngleSwitch() throws {
        XCTAssertTrue(tester.isEnteredPage())
        tester.calculatorButton(for: "Deg").tap()
        tester.calculatorButton(for: "sin").tap()
        tester.calculatorButton(for: "3").tap()
        tester.calculatorButton(for: "0").tap()
        tester.calculatorButton(for: "EXE").tap()
        XCTAssertEqual(tester.calculatorDisplayScreenEquation.label, "sin30")
        XCTAssertEqual(tester.calculatorDisplayScreenHistoryLog.label, "sin30=\(sin(30.0))")
    }
}
