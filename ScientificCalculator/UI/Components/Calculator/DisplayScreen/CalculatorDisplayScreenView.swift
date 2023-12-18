//
//  CalculatorDisplayScreenView.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-04.
//

import SwiftUI
import ScientificCalculator_iOS

struct CalculatorDisplayScreenView: View {
    var text: String
    var answer: Double
    var variable: CalculatorVariable

    var body: some View {
        VStack(spacing: Dimen.spacing(.small)) {
            CalculatorDisplayScreenEquationView(text)
            CalculatorDisplayScreenAnswerView(answer, variable: variable)
        }
        .stackStyle(StackStyle.CalculatorDisplayScreen())
    }
}

struct CalculatorDisplayScreenEquationView: View {
    private let tracking: CGFloat = 2.0
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        if text.isEmpty {
            emptyContent()
        } else {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    content(text)
                        .rotationEffect(Angle(degrees: 180))
                        .id(0)
                }
                .rotationEffect(Angle(degrees: 180))
                .onChange(of: text) { _ in
                    proxy.scrollTo(0, anchor: .leading)
                }
            }
        }
    }

    func emptyContent() -> some View {
        Text(" ")
            .textStyle(TextStyle.CalculatorDisplayEquation())
    }

    func content(_ text: String) -> some View {
        Text(text)
            .textStyle(TextStyle.CalculatorDisplayEquation())
    }
}

struct CalculatorDisplayScreenAnswerView: View {
    private let tracking: CGFloat = 2.0
    var answer: Double
    var variable: CalculatorVariable

    init(_ answer: Double, variable: CalculatorVariable) {
        self.answer = answer
        self.variable = variable
    }

    var body: some View {
        Text(CalculatorNumberFormatter().string(number: answer, variable: variable))
            .tracking(tracking)
            .textStyle(TextStyle.CalculatorDisplayAnswer())
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct CalculatorDisplayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorDisplayScreenView(text: "", answer: 0.0, variable: .answer)
            CalculatorDisplayScreenView(text: "11+5", answer: 16.0, variable: .answer)
            CalculatorDisplayScreenView(text: "999999999999999999999999999999999999999999999999999999999999", answer: 999999999999999.01, variable: .answer)
            CalculatorDisplayScreenView(text: "", answer: 0, variable: .a)
            CalculatorDisplayScreenView(text: "9999", answer: 9999, variable: .a)
        }
    }
}
