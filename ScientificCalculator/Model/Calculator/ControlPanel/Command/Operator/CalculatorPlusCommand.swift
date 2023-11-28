//
//  ScientificCalculatorPlusCommand.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-19.
//

class ScientificCalculatorPlusCommand: ScientificCalculatorCommand {
    override func execute(node: CalculatorKeyNode) throws -> CalculatorCommandResult {
        if node.prev == nil && node.next != nil {
            return CalculatorCommandResult(head: node, tail: node, newKeys: CalculatorKeyList(node))  // no calculation for +ve sign, i.e. +1
        }
        return try super.execute(node: node)
    }

    override func answer(left: Float, right: Float) -> Float {
        return left + right
    }
}
