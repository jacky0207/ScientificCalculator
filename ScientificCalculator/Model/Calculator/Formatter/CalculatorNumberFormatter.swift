//
//  CalculatorNumberFormatter.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-10.
//

import Foundation
import ScientificCalculator_iOS

class CalculatorNumberFormatter {
    struct CalculatorFormattedNumber {
        var number: Double
        var power: Int
    }

    private let maxLength: Int = 10

    func truncatedText(from number: Double) -> String {
        return number.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", number) : String(number)
    }

    func isFormatNeeded(for number: Double) -> Bool {
        return number >= pow(10, Double(maxLength))
    }

    func formattedNumber(for number: Double) -> CalculatorFormattedNumber {
        var number = number
        var power = 0
        while number / 10 >= 1 {
            number /= 10
            power += 1
        }
        return CalculatorFormattedNumber(number: number, power: power)
    }

    func string(number: Double, variable: CalculatorVariable) -> String {
        var text = ""
        if !isFormatNeeded(for: number) {
            text += truncatedText(from: number)
        } else {
            let formattedNumber = formattedNumber(for: number)
            text += "\(truncatedText(from: formattedNumber.number))"
            text += "\(CalculatorKey.operator(.multiply).text)"
            text += "\(CalculatorKey.function(.powerOfTen).text)"
            text += "\(formattedNumber.power)"
        }
        if number != 0 && variable != .answer {
            text += "->\(variable.rawValue)"
        }
        return text
    }

    func string(equation: String, number: Double, variable: CalculatorVariable) -> String {
        return equation + "=" + string(number: number, variable: variable)
    }
}
