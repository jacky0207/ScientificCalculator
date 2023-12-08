//
//  FontStyle+Orbitron.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-08.
//

import SwiftUI

extension FontStyle {
    enum Orbitron: String {
        case regular = "Orbitron-Regular"
        case medium = "Orbitron-Medium"
        case bold =  "Orbitron-Bold"
    }

    func orbitron(for size: FontSize) -> Font {
        return Font.custom(Orbitron.regular.rawValue, size: size.rawValue)
    }
}
