//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Mehmet Tarhan on 28/05/2022.
//

@testable import TipCalculator
import XCTest

class TipCalculatorTests: XCTestCase {
    var calculator: Calculator!

    override func setUpWithError() throws {
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }

    func testCalculateTip() throws {
        let total = 100.0
        let tipPercentage = 50.0
        let tip = try calculator.calculateTip(fromTotal: total, withPercentage: tipPercentage)

        XCTAssertEqual(tip, 50)
    }

    func testCalculateTipWithNegativeTotal() throws {
        let total = -100.0
        let tipPercentage = 50.0

        XCTAssertThrowsError(try calculator.calculateTip(fromTotal: total, withPercentage: tipPercentage)) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.negativeTotal)
        }
    }

    func testCalculateTipWithNegativeTip() throws {
        let total = 100.0
        let tipPercentage = -50.0

        XCTAssertThrowsError(try calculator.calculateTip(fromTotal: total, withPercentage: tipPercentage))
    }

    func testCalculateBill() throws {
        let total = 100.0
        let tipPercentage = 50.0
        let tip = try calculator.calculateTip(fromTotal: total, withPercentage: tipPercentage)
        let bill = try calculator.calculateBill(fromTotal: total, andTip: tip)

        XCTAssertEqual(bill, 150.0)
    }

    func testSumOfTwoNumbers() {
        let sum = Maths.add(x: 10, y: 5)
        XCTAssertEqual(sum, 15)
    }

    func testDifferenceOfTwoNumbers() {
        let dif = Maths.substract(x: 10, y: 5)
        XCTAssertEqual(dif, 5)
    }
}
