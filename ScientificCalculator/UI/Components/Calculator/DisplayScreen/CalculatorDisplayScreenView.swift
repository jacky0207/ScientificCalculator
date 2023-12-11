//
//  CalculatorDisplayScreenView.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-04.
//

import SwiftUI

struct CalculatorDisplayScreenView: View {
    var text: String
    var answer: Double

    var body: some View {
        VStack(spacing: Dimen.spacing(.small)) {
            CalculatorDisplayScreenEquationView(text)
            CalculatorDisplayScreenAnswerView(answer)
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
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Text(text.isEmpty ? " " : text)
                        .tracking(tracking)
                        .textStyle(TextStyle.CalculatorDisplayEquation())
                        .id(0)
                }
            }
            .onAppear {
                proxy.scrollTo(0, anchor: .trailing)
            }
            .onChange(of: text) { _ in
                proxy.scrollTo(0, anchor: .trailing)
            }
        }
    }
}

struct CalculatorDisplayScreenAnswerView: View {
    private let tracking: CGFloat = 2.0
    var answer: Double

    init(_ answer: Double) {
        self.answer = answer
    }

    var body: some View {
        Text(CalculatorNumberFormatter().string(from: answer))
            .tracking(tracking)
            .textStyle(TextStyle.CalculatorDisplayAnswer())
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct CalculatorDisplayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorDisplayScreenView(text: "", answer: 0.0)
            CalculatorDisplayScreenView(text: "11+5", answer: 16.0)
            CalculatorDisplayScreenView(text: "999999999999999999999999999999999999999999999999999999999999", answer: 999999999999999.01)
        }
    }
}
