//
//  Calculator.swift
//  TipCalculator
//
//  Created by Mehmet Tarhan on 28/05/2022.
//

import Foundation

class Calculator {
    func calculateTip(fromTotal total: Double, withPercentage percentage: Double) throws -> Double {
        guard total > 0 else { throw CalculatorError.negativeTotal }
        guard percentage > 0 else { throw CalculatorError.negativePercentage }
        let tip = (total * percentage) / 100
        return tip
    }

    func calculateBill(fromTotal total: Double, andTip tip: Double) throws -> Double {
        guard total > 0 else { throw CalculatorError.negativeTotal }
        guard tip > 0 else { throw CalculatorError.negativeTip }
        let bill = total + tip
        return bill
    }
}

enum CalculatorError: Error, CustomStringConvertible {
    case negativeTotal
    case negativePercentage
    case negativeTip

    var description: String {
        switch self {
        case .negativeTotal: return "Total cannot be a negative value"
        case .negativePercentage: return "Tip percentage cannot be a negative value"
        case .negativeTip: return "Tip cannot be a negative value"
        }
    }
}
