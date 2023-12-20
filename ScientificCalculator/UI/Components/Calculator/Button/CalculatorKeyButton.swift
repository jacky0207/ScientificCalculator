//
//  CalculatorKeyButton.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-27.
//

import SwiftUI
import ScientificCalculator_iOS

struct CalculatorKeyButton: View {
    var key: CalculatorKey
    var action: (CalculatorKey) -> Void

    init(_ key: CalculatorKey, action: @escaping (CalculatorKey) -> Void) {
        self.key = key
        self.action = action
    }

    var body: some View {
        CalculatorButton(
            backgroundColor: CalculatorKeyButtonStyle.backgroundColor(for: key),
            backgroundHighlightColor: CalculatorKeyButtonStyle.backgroundHighlightColor(for: key),
            action: { action(key) },
            label: { CalculatorKeyButtonLabel(key: key) }
        )
        .accessibilityIdentifier(CalculatorButton.identifier(key.text))
    }
}

struct CalculatorKeyButtonLabel: View {
    var key: CalculatorKey

    var body: some View {
        switch key {
        case .number(let number):
            Text(number.rawValue)
        case .operator(let `operator`):
            switch `operator` {
            case .plus:
                Image(systemName: "plus")
            case .minus:
                Image(systemName: "minus")
            case .multiply:
                Image(systemName: "multiply")
            case .divide:
                Image(systemName: "divide")
            }
        case .function(let function):
            switch function {
            case .exponent:
                Text("EXP")
            case .factorial, .inverseFraction, .square, .cube:
                Text("x\(function.rawValue)")
            case .powerOfTen, .exponential:
                Text("\(function.rawValue)\u{02E3}")
            default:
                Text(function.rawValue)
            }
        case .variable(let variable):
            Text(variable.rawValue)
        case .bracket(let bracket):
            Text(bracket.rawValue)
        }
    }
}

struct CalculatorKeyButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorKeyButton(.number(.one)) { _ in }
            CalculatorKeyButton(.operator(.plus)) { _ in }
            CalculatorKeyButton(.function(.sin)) { _ in }
            CalculatorKeyButton(.variable(.a)) { _ in }
            CalculatorKeyButton(.bracket(.openBracket)) { _ in }
        }
    }
}
