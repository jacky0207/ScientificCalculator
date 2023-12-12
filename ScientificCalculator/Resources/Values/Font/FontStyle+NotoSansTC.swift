//
//  FontStyle+NotoSansTC.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-08-28.
//

import SwiftUI

extension FontStyle {
    enum NotoSansTC: String {
        case regular = "NotoSansTC-Regular"
        case medium = "NotoSansTC-Medium"
        case bold =  "NotoSansTC-Bold"
    }

    func notoSansTC(for size: FontSize) -> Font {
        return Font.custom(NotoSansTC.regular.rawValue, size: size.rawValue)
    }
}
