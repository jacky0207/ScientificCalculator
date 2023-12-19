//
//  Color+Hex.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI

extension ColorStyle {
    var hexValue: Int {
        switch self {
        case .primary:
            return 0x003079
        case .primaryHighlight:
            return 0x0048B6
        case .secondary:
            return 0x4F678A
        case .secondaryHighlight:
            return 0x779BCE
        case .error:
            return 0xBB2F2F
        case .errorHighlight:
            return 0xD26161
        case .textPrimary:
            return 0xFFFFFF
        case .textSecondary:
            return 0x000000
        case .background:
            return 0xDEDEDE
        case .calculatorBackground:
            return ColorStyle.background.hexValue
        case .calculatorDisplayScreenBackground:
            return 0xE1EBF0
        case .shadow:
            return 0x8B8B8B
        }
    }

    var color: Color {
        return Color(hex: self.hexValue)
    }
}

extension Color {
    init(hex: Int) {
        let alpha = hex > 0xFFFFFF ? (Double((hex >> 24) & 0xff) / 255): 1
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double(hex & 0xff) / 255

        self.init(
            .sRGB,
            red: red,
            green: green,
            blue: blue,
            opacity: alpha
        )
    }

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
