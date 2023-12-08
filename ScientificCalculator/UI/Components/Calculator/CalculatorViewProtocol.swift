//
//  CalculatorViewProtocol.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-28.
//

import ScientificCalculator_iOS

protocol CalculatorViewProtocol {
    var calculator: ScientificCalculator { get set }
    func appendKey(_ key: CalculatorKey)
    func delete()
    func clearAll()
    func calculate()
}
