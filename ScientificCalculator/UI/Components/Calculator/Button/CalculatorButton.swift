//
//  CalculatorButton.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-29.
//

import SwiftUI

struct CalculatorButton<Label: View>: View {
    static func identifier(_ identifier: String) -> String where Label == EmptyView {
        return "calculatorButton-\(identifier)"
    }

    var backgroundColor: Color
    var backgroundHighlightColor: Color
    var action: () -> Void
    var label: () -> Label

    var body: some View {
        Button(
            action: {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                action()
            },
            label: label
        )
        .buttonStyle(CalculatorKeyButtonStyle(backgroundColor: backgroundColor, backgroundHighlightColor: backgroundHighlightColor))
    }
}

struct CalculatorPrimaryButton: View {
    var action: () -> Void
    var text: String

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.primary.color,
            backgroundHighlightColor: ColorStyle.primaryHighlight.color,
            action: action,
            label: { Text(text) }
        )
        .accessibilityAddTraits(.isButton)
        .accessibilityIdentifier(CalculatorButton.identifier(text))
    }
}

struct CalculatorSecondaryButton: View {
    var action: () -> Void
    var text: String

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.secondary.color,
            backgroundHighlightColor: ColorStyle.secondaryHighlight.color,
            action: action,
            label: { Text(text) }
        )
        .accessibilityAddTraits(.isButton)
        .accessibilityIdentifier(CalculatorButton.identifier(text))
    }
}

struct CalculatorErrorButton: View {
    var action: () -> Void
    var text: String

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.error.color,
            backgroundHighlightColor: ColorStyle.errorHighlight.color,
            action: action,
            label: { Text(text) }
        )
        .accessibilityAddTraits(.isButton)
        .accessibilityIdentifier(CalculatorButton.identifier(text))
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorPrimaryButton(action: {}, text: "Primary")
            CalculatorSecondaryButton(action: {}, text: "Secondary")
            CalculatorErrorButton(action: {}, text: "Error")
        }
    }
}
