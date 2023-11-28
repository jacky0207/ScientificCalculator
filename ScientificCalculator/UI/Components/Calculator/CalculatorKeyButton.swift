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
        Button(
            action: { action(key) },
            label: { CalculatorKeyButtonLabel(key: key) }
        )
        .buttonStyle(CalculatorKeyButtonStyle(key: key))
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
            Text(function.rawValue)
        case .variable(let variable):
            Text(variable.rawValue)
        case .bracket(let bracket):
            Text(bracket.rawValue)
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorKeyButton(.number(.one)) { key in

            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Number")

            CalculatorKeyButton(.operator(.plus)) { key in

            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Operator")

            CalculatorKeyButton(.function(.sin)) { key in

            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Function")

            CalculatorKeyButton(.variable(.a)) { key in

            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Variable")

            CalculatorKeyButton(.bracket(.openBracket)) { key in

            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Bracket")
        }
    }
}
