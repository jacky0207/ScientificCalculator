//
//  View+TextStyle.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-08-28.
//

import SwiftUI

extension View {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct TextStyle {
    struct Regular: ViewModifier {
        var foregroundColor: Color = ColorStyle.textPrimary.color
        var fontSize: FontSize = .normal

        func body(content: Content) -> some View {
            content
                .foregroundColor(foregroundColor)
                .font(FontStyle.regular.orbitron(for: fontSize))
        }
    }

    struct Medium: ViewModifier {
        var foregroundColor: Color = ColorStyle.textPrimary.color
        var fontSize: FontSize = .normal

        func body(content: Content) -> some View {
            content
                .foregroundColor(foregroundColor)
                .font(FontStyle.medium.orbitron(for: fontSize))
        }
    }

    struct Bold: ViewModifier {
        var foregroundColor: Color = ColorStyle.textPrimary.color
        var fontSize: FontSize = .normal
        
        func body(content: Content) -> some View {
            content
                .foregroundColor(foregroundColor)
                .font(FontStyle.bold.orbitron(for: fontSize))
        }
    }
}

extension TextStyle {
    struct CalculatorKeyText: ViewModifier {
        func body(content: Content) -> some View {
            content
                .textStyle(TextStyle.Medium(fontSize: .large))
        }
    }

    struct CalculatorDisplayEquation: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(minHeight: Dimen.height(.calculatorEquation))
                .textStyle(TextStyle.Medium(foregroundColor: ColorStyle.textSecondary.color, fontSize: .xxLarge))
        }
    }

    struct CalculatorDisplayAnswer: ViewModifier {
        func body(content: Content) -> some View {
            content
                .scaledToFit()
                .minimumScaleFactor(0.1)
                .textStyle(TextStyle.Medium(foregroundColor: ColorStyle.textSecondary.color, fontSize: .xxxLarge))
        }
    }

    struct CalculatorDisplayLog: ViewModifier {
        func body(content: Content) -> some View {
            content
                .lineLimit(2)
                .truncationMode(.middle)
                .textStyle(TextStyle.Medium(foregroundColor: ColorStyle.textSecondary.color, fontSize: .large))
        }
    }
}
