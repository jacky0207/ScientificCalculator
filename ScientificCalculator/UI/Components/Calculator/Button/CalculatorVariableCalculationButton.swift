//
//  CalculatorVariableCalculationButton.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-11.
//

import SwiftUI
import ScientificCalculator_iOS

struct CalculatorVariableCalculationButton: View {
    var variable: CalculatorVariable
    var action: (CalculatorVariable) -> Void

    init(
        _ variable: CalculatorVariable,
        action: @escaping (CalculatorVariable) -> Void
    ) {
        self.variable = variable
        self.action = action
    }

    var body: some View {
        CalculatorButton(
            backgroundColor: CalculatorKeyButtonStyle.backgroundColor(for: .variable(variable)),
            backgroundHighlightColor: CalculatorKeyButtonStyle.backgroundHighlightColor(for: .variable(variable)),
            action: { action(variable) },
            label: { CalculatorVariableCalculationButtonLabel(variable: variable) }
        )
        .accessibilityAddTraits(.isButton)
        .accessibilityIdentifier(CalculatorButton.identifier(CalculatorVariableCalculationButtonLabel.text(for: variable)))
    }
}

struct CalculatorVariableCalculationButtonLabel: View {
    static func text(for variable: CalculatorVariable) -> String {
        return "->\(variable.rawValue)"
    }

    var variable: CalculatorVariable

    var body: some View {
        Text(Self.text(for: variable))
    }
}

struct CalculatorVariableCalculationButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorVariableCalculationButton(.a, action: { _ in })
    }
}
