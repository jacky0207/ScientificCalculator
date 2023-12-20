//
//  View+ImageStyle.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-08-29.
//

import SwiftUI

extension View {
    func imageStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct ImageStyle {
    struct Icon: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width: Dimen.width(.icon), height: Dimen.height(.icon))
                .foregroundColor(ColorStyle.primary.color)
        }
    }
}
