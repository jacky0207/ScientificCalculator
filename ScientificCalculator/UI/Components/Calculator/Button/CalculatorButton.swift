//
//  CalculatorButton.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-29.
//

import SwiftUI

struct CalculatorButton<Label: View>: View {
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

struct CalculatorPrimaryButton<Label: View>: View {
    var action: () -> Void
    var label: () -> Label

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.primary.color,
            backgroundHighlightColor: ColorStyle.primaryHighlight.color,
            action: action,
            label: label
        )
    }
}

struct CalculatorSecondaryButton<Label: View>: View {
    var action: () -> Void
    var label: () -> Label

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.secondary.color,
            backgroundHighlightColor: ColorStyle.secondaryHighlight.color,
            action: action,
            label: label
        )
    }
}

struct CalculatorErrorButton<Label: View>: View {
    var action: () -> Void
    var label: () -> Label

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.error.color,
            backgroundHighlightColor: ColorStyle.errorHighlight.color,
            action: action,
            label: label
        )
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorPrimaryButton(action: {}, label: { Text("Primary") })
            CalculatorSecondaryButton(action: {}, label: { Text("Secondary") })
            CalculatorErrorButton(action: {}, label: { Text("Error") })
        }
    }
}
