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

    @State private var alertTitle = ""
    @State private var isAlertPresented = false

    var body: some View {
        VStack(spacing: Dimen.spacing(.normal)) {
            CalculatorDisplayScreenView(
                text: calculator.text,
                answer: calculator.answer,
                variable: calculator.logs.last?.variable ?? .answer
            )
            CalculatorControlPanelView(
                appendKeyAction: appendKey,
                deleteAction: delete,
                clearAllAction: clearAll,
                calculateAction: calculate,
                angle: calculator.angle,
                calculateToVariableAction: calculate
            )
        }
        .frame(maxWidth: .infinity)
        .stackStyle(StackStyle.Calculator())
        .alert(alertTitle, isPresented: $isAlertPresented) {
            Button("ok", action: {})
        }
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
            self.alertTitle = error.localizedDescription
            self.isAlertPresented.toggle()
        }
    }

    func calculate(to variable: CalculatorVariable) {
        do {
            try calculator.calculate(to: variable)
        } catch let error {
            self.alertTitle = error.localizedDescription
            self.isAlertPresented.toggle()
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
