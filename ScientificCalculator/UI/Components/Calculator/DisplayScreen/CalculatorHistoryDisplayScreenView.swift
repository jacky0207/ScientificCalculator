//
//  CalculatorHistoryDisplayScreenView.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-13.
//

import SwiftUI
import ScientificCalculator_iOS

struct CalculatorHistoryDisplayScreenView: View {
    var text: String
    var logs: [any CalculatorLog]

    var body: some View {
        VStack(spacing: Dimen.spacing(.small)) {
            CalculatorDisplayScreenHistoryView(logs: logs)
            CalculatorHistoryDisplayScreenEquationView(text)
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("calculatorDisplayScreen")
        .stackStyle(StackStyle.CalculatorDisplayScreen())
    }
}

struct CalculatorDisplayScreenHistoryView: View {
    private let tracking: CGFloat = 2.0
    var logs: [any CalculatorLog]

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(spacing: Dimen.spacing(.small)) {
                    ForEach(logs.indices, id: \.self) { index in
                        content(logs[index])
                    }
                }
                .rotationEffect(Angle(degrees: 180))
                .id(0)
            }
            .rotationEffect(Angle(degrees: 180))
            .onChange(of: logs.count) { _ in
                proxy.scrollTo(0, anchor: .top)
            }
        }
    }

    func content(_ log: CalculatorLog) -> some View {
        Text(CalculatorNumberFormatter().string(
            equation: log.keys.text,
            number: log.answer,
            variable: log.variable
        ))
        .tracking(tracking)
        .accessibilityIdentifier("calculatorDisplayScreenHistoryLog")
        .textStyle(TextStyle.CalculatorDisplayLog())
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct CalculatorHistoryDisplayScreenEquationView: View {
    private let tracking: CGFloat = 2.0
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            content(text)
                .rotationEffect(Angle(degrees: 180))
        }
        .rotationEffect(Angle(degrees: 180))
    }

    func content(_ text: String) -> some View {
        Text(text)
            .accessibilityIdentifier("calculatorDisplayScreenEquation")
            .textStyle(TextStyle.CalculatorDisplayEquation())
    }
}

struct CalculatorHistoryDisplayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorHistoryDisplayScreenView(
                text: "1234567890",
                logs: []
            )
            CalculatorHistoryDisplayScreenView(
                text: "1234567890123456789012345678901234567890",
                logs: [
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.one)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.two)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.one)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.two)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.one)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.two)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.one)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.two)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.one)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.two)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                    ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.one)
                        ),
                        answer: 1,
                        variable: .a
                    ),
                ]
            )
            CalculatorHistoryDisplayScreenView(
                text: "",
                logs: .init(
                    repeating: ScientificCalculatorLog(
                        keys: CalculatorKeyList(
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one),
                            .number(.one)
                        ),
                        answer: 3,
                        variable: .answer
                    ),
                    count: 100
                )
            )
        }
        .environment(\.defaultMinListRowHeight, 1)
    }
}
