//
//  View+StackStyle.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-08-28.
//

import SwiftUI

extension View {
    func stackStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct StackStyle {
    struct Calculator: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(.all, Dimen.spacing(.large))
                .background(ColorStyle.calculatorBackground.color)
        }
    }

    struct CalculatorDisplayScreen: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity)
                .padding(.vertical, Dimen.spacing(.normal))
                .padding(.horizontal, Dimen.spacing(.xLarge))
                .background(
                    RoundedRectangle(cornerRadius: Dimen.corner(.large))
                        .fill(ColorStyle.calculatorDisplayScreenBackground.color)
                        .shadow(
                            color: ColorStyle.shadow.color.opacity(Double(Dimen.shadow(.alphaLarge))),
                            radius: Dimen.corner(.normal),
                            x: Dimen.shadow(.offsetXLarge),
                            y: Dimen.shadow(.offsetYLarge)
                        )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: Dimen.corner(.large))
                        .strokeBorder(
                            ColorStyle.secondary.color,
                            lineWidth: Dimen.border(.large)
                        )
                )
        }
    }
}
