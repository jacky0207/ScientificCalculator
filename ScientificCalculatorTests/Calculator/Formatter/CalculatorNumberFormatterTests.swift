//
//  CalculatorNumberFormatterTests.swift
//  CalculatorNumberFormatterTests
//
//  Created by Jacky Lam on 2023-11-27.
//

import XCTest
@testable import ScientificCalculator

final class CalculatorNumberFormatterTests: XCTestCase {
    var formatter = CalculatorNumberFormatter()

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testCalculatorNumberFormatter_WithDecimal_NotTruncate() throws {
        XCTAssertEqual(formatter.truncatedText(from: 10.2), "10.2")
    }

    func testCalculatorNumberFormatter_NoDecimal_Truncate() throws {
        XCTAssertEqual(formatter.truncatedText(from: 10.0), "10")
    }

    func testCalculatorNumberFormatter_isFormatNeeded() throws {
        XCTAssertFalse(formatter.isFormatNeeded(for: 9999999999))
        XCTAssertTrue(formatter.isFormatNeeded(for: 10000000000))
    }

    func testCalculatorNumberFormatter_FormattedNumber() throws {
        let formattedNumber = formatter.formattedNumber(for: 1001)
        XCTAssertEqual(formattedNumber.number, 1.001)
        XCTAssertEqual(formattedNumber.power, 3)
    }

    func testCalculatorNumberFormatter_NoNeedFormat_OriginalString() throws {
        XCTAssertEqual(formatter.string(from: 9999999999, variable: .answer), "9999999999")
    }

    func testCalculatorNumberFormatter_NeedFormat_FormattedString() throws {
        XCTAssertEqual(formatter.string(from: 10000000000, variable: .answer), "1xıo10")
    }

    func testCalculatorNumberFormatter_ClearAnswer_HideVariable() throws {
        XCTAssertEqual(formatter.string(from: 0, variable: .a), "0")
    }

    func testCalculatorNumberFormatter_SaveToVariable_AppendString() throws {
        XCTAssertEqual(formatter.string(from: 100, variable: .a), "100->a")
    }
}
