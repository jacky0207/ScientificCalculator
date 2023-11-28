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
    }
}

extension Dimen.Height {
    var rawValue: CGFloat {
        switch self {
        case .buttonLabel:
            return Dimen.width(.buttonLabel)
        }
    }
}
