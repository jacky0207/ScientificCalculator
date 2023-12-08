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

struct CalculatorDeleteButton: View {
    var action: () -> Void

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.error.color,
            backgroundHighlightColor: ColorStyle.errorHighlight.color,
            action: action,
            label: {
                Text("DEL")
            }
        )
    }
}

struct CalculatorAllClearButton: View {
    var action: () -> Void

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.error.color,
            backgroundHighlightColor: ColorStyle.errorHighlight.color,
            action: action,
            label: {
                Text("AC")
            }
        )
    }
}

struct CalculatorCalculateButton: View {
    var action: () -> Void

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.primary.color,
            backgroundHighlightColor: ColorStyle.primaryHighlight.color,
            action: action,
            label: {
                Text("EXE")
            }
        )
    }
}

struct CalculatorShiftButton: View {
    var action: () -> Void

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.secondary.color,
            backgroundHighlightColor: ColorStyle.secondaryHighlight.color,
            action: action,
            label: {
                Text("Shift")
            }
        )
    }
}

struct CalculatorFunctionSwitchButton: View {
    var action: () -> Void

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.secondary.color,
            backgroundHighlightColor: ColorStyle.secondaryHighlight.color,
            action: action,
            label: {
                Text("Fn")
            }
        )
    }
}

struct CalculatorVariableSwitchButton: View {
    var action: () -> Void

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.secondary.color,
            backgroundHighlightColor: ColorStyle.secondaryHighlight.color,
            action: action,
            label: {
                Text("Var")
            }
        )
    }
}

struct CalculatorFunctionButton: View {
    var action: () -> Void

    var body: some View {
        CalculatorButton(
            backgroundColor: ColorStyle.secondary.color,
            backgroundHighlightColor: ColorStyle.secondaryHighlight.color,
            action: action,
            label: {
                Text("Fn")
            }
        )
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorDeleteButton {}
            CalculatorAllClearButton {}
            CalculatorCalculateButton {}
            CalculatorShiftButton {}
            CalculatorFunctionSwitchButton {}
            CalculatorVariableSwitchButton {}
            CalculatorFunctionButton {}
        }
    }
}
