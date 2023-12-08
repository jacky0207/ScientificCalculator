//
//  CalculatorView.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-04.
//

import ScientificCalculator_iOS
import SwiftUI

struct CalculatorView: View, CalculatorViewProtocol {
    @ObservedObject var calculator: ScientificCalculator = ScientificCalculator()

    var body: some View {
        VStack(spacing: Dimen.spacing(.normal)) {
            CalculatorDisplayScreenView(
                text: calculator.text,
                answer: calculator.answer
            )
            CalculatorControlPanelView(
                appendKeyAction: appendKey,
                deleteAction: delete,
                clearAllAction: clearAll,
                calculateAction: calculate
            )
        }
        .frame(maxWidth: .infinity)
        .stackStyle(StackStyle.Calculator())
    }

    func appendKey(_ key: CalculatorKey) {
        calculator.appendKey(key)
    }

    func delete() {
        calculator.delete()
    }

    func clearAll() {
        calculator.clearAll()
    }

    func calculate() {
        do {
            try calculator.calculate()
        } catch let error {
            AppState.shared.setAlert(for: AlertParams(title: error.localizedDescription))
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorView()
        }
    }
}
