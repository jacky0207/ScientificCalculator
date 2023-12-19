//
//  Dimen+Height.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-27.
//

import UIKit

extension Dimen {
    func height(_ height: Height) -> CGFloat {
        return height.rawValue
    }
}

extension Dimen {
    static func height(_ height: Height) -> CGFloat {
        return shared.height(height)
    }

}

extension Dimen {
    enum Height {
        case buttonLabel
        case icon
        case calculatorEquation
    }
}

extension Dimen.Height {
    var rawValue: CGFloat {
        switch self {
        case .icon:
            return Dimen.width(.icon)
        case .buttonLabel:
            return 36
        case .calculatorEquation:
            return 40
        }
    }
}
