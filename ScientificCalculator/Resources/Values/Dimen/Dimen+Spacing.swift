//
//  Dimen+Spacing.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-08-28.
//

import UIKit

extension Dimen {
    func spacing(_ spacing: Spacing) -> CGFloat {
        return spacing.rawValue
    }
}

extension Dimen {
    static func spacing(_ spacing: Spacing) -> CGFloat {
        return shared.spacing(spacing)
    }
}

extension Dimen {
    enum Spacing: CGFloat {
        case xxSmall = 2
        case xSmall = 4
        case small = 8
        case normal = 12
        case large = 16
        case xLarge = 20
        case xxLarge = 24
    }
}
