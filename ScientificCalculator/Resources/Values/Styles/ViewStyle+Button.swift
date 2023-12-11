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
    var backgroundColor: Color
    var backgroundHighlightColor: Color

    init(
        backgroundColor: Color,
        backgroundHighlightColor: Color
    ) {
        self.backgroundColor = backgroundColor
        self.backgroundHighlightColor = backgroundHighlightColor
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(TextStyle.CalculatorKeyText())
            .frame(width: Dimen.width(.buttonLabel), height: Dimen.height(.buttonLabel))
            .frame(maxWidth: .infinity)
            .padding(.horizontal, Dimen.spacing(.small))
            .padding(.vertical, Dimen.spacing(.xSmall))
            .background(
                RoundedRectangle(cornerRadius: Dimen.corner(.normal))
                    .fill(configuration.isPressed ? backgroundHighlightColor : backgroundColor)
                    .shadow(
                        color: ColorStyle.shadow.color.opacity(Double(Dimen.shadow(.alpha))),
                        radius: Dimen.corner(.xSmall),
                        x: Dimen.shadow(.offsetX),
                        y: Dimen.shadow(.offsetY)
                    )
            )
    }
}
