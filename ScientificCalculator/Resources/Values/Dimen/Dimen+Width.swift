//
//  Dimen+Width.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-27.
//

import UIKit

extension Dimen {
    func width(_ width: Width) -> CGFloat {
        return width.rawValue
    }
}

extension Dimen {
    static func width(_ width: Width) -> CGFloat {
        return shared.width(width)
    }

}

extension Dimen {
    enum Width {
        case icon
        case buttonLabel
    }
}

extension Dimen.Width {
    var rawValue: CGFloat {
        switch self {
        case .icon:
            return 28
        case .buttonLabel:
            return 48
        }
    }
}
