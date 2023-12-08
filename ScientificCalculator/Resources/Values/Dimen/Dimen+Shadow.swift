//
//  Dimen+Shadow.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-04.
//

import UIKit

extension Dimen {
    func shadow(_ shadow: Shadow) -> CGFloat {
        return shadow.rawValue
    }
}

extension Dimen {
    static func shadow(_ shadow: Shadow) -> CGFloat {
        return shared.shadow(shadow)
    }

}

extension Dimen {
    enum Shadow {
        case alpha
        case alphaLarge
        case offsetX
        case offsetXLarge
        case offsetY
        case offsetYLarge
    }
}

extension Dimen.Shadow {
    var rawValue: CGFloat {
        switch self {
        case .alpha:
            return 0.5
        case .alphaLarge:
            return 0.75
        case .offsetX:
            return 4
        case .offsetXLarge:
            return 8
        case .offsetY:
            return 4
        case .offsetYLarge:
            return 8
        }
    }
}
