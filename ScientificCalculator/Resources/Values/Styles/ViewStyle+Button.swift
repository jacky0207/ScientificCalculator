//
//  ViewStyle+Button.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI
import ScientificCalculator_iOS

extension CalculatorKeyButtonStyle {
    static func backgroundColor(for key: CalculatorKey) -> Color {
        switch key {
        case .number, .operator:
            return ColorStyle.primary.color
        case .function, .variable, .bracket:
            return ColorStyle.secondary.color
        }
    }

    static func backgroundHighlightColor(for key: CalculatorKey) -> Color {
        switch key {
        case .number, .operator:
            return ColorStyle.primaryHighlight.color
        case .function, .variable, .bracket:
            return ColorStyle.secondaryHighlight.color
        }
    }
}

struct CalculatorKeyButtonStyle: ButtonStyle {
    var key: CalculatorKey

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(TextStyle.Regular(fontSize: .xLarge))
            .frame(width: Dimen.width(.buttonLabel), height: Dimen.height(.buttonLabel))
            .padding(.horizontal, Dimen.spacing(.normal))
            .padding(.vertical, Dimen.spacing(.xSmall))
            .background(
                RoundedRectangle(cornerRadius: Dimen.corner(.normal))
                    .fill(configuration.isPressed ? CalculatorKeyButtonStyle.backgroundHighlightColor(for: key) : CalculatorKeyButtonStyle.backgroundColor(for: key))
            )
    }
}
