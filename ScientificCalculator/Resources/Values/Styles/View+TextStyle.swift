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
                .font(FontStyle.regular.notoSansTC(for: fontSize))
        }
    }

    struct Medium: ViewModifier {
        var foregroundColor: Color = ColorStyle.textPrimary.color
        var fontSize: FontSize = .normal

        func body(content: Content) -> some View {
            content
                .foregroundColor(foregroundColor)
                .font(FontStyle.medium.notoSansTC(for: fontSize))
        }
    }

    struct Bold: ViewModifier {
        var foregroundColor: Color = ColorStyle.textPrimary.color
        var fontSize: FontSize = .normal
        
        func body(content: Content) -> some View {
            content
                .foregroundColor(foregroundColor)
                .font(FontStyle.bold.notoSansTC(for: fontSize))
        }
    }
}
