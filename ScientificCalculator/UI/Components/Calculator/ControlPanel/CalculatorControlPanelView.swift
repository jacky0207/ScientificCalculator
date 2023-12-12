//
//  CalculatorControlPanelView.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-04.
//

import SwiftUI
import ScientificCalculator_iOS

struct CalculatorControlPanelView: View {
    var appendKeyAction: (_ key: CalculatorKey) -> Void
    var deleteAction: () -> Void
    var clearAllAction: () -> Void
    var calculateAction: () -> Void

    var functionEnabled = true
    @Binding var angle: CalculatorAngle
    @State private var isFnSelected = false

    var variableEnabled = false
    var isSaveToEnabled = false
    @State private var isSaveToSelected = false
    var calculateToVariableAction: (_ variable: CalculatorVariable) -> Void

    var body: some View {
        VStack(spacing: Dimen.spacing(.small)) {
            CalculatorActionControlPanelView(
                functionEnabled: functionEnabled,
                angle: $angle,
                isFnSelected: $isFnSelected,
                isSaveToEnabled: isSaveToEnabled,
                isSaveToSelected: $isSaveToSelected
            )
            if variableEnabled {
                CalculatorVariableControlPanelView(
                    isFnSelected: isFnSelected,
                    isSaveToSelected: isSaveToSelected,
                    appendKeyAction: appendKeyAction,
                    calculateToVariableAction: calculateToVariableAction
                )
            }
            if functionEnabled {
                CalculatorFunctionControlPanelView(
                    isFnSelected: isFnSelected,
                    appendKeyAction: appendKeyAction
                )
            }
            CalculatorBasicControlPanelView(
                isFnSelected: isFnSelected,
                appendKeyAction: appendKeyAction,
                deleteAction: deleteAction,
                clearAllAction: clearAllAction,
                calculateAction: calculateAction
            )
        }
    }
}

struct CalculatorActionControlPanelView: View {
    var functionEnabled: Bool
    @Binding var angle: CalculatorAngle
    @Binding var isFnSelected: Bool

    var isSaveToEnabled: Bool
    @Binding var isSaveToSelected: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: Dimen.spacing(.small)) {
            HStack(spacing: Dimen.spacing(.small)) {
                if functionEnabled {
                    CalculatorSecondaryButton(action: { isFnSelected.toggle() }) {
                        Text("Fn")
                    }
                }
                if isSaveToEnabled {
                    CalculatorSecondaryButton(action: { isSaveToSelected.toggle() }) {
                        Text("STO")
                    }
                }
                if functionEnabled {
                    CalculatorSecondaryButton(action: { angle.toggle() }) {
                        Text(angle.rawValue)
                    }
                }
            }
        }
    }
}

struct CalculatorBasicControlPanelView: View {
    var isFnSelected: Bool
    var appendKeyAction: (_ key: CalculatorKey) -> Void
    var deleteAction: () -> Void
    var clearAllAction: () -> Void
    var calculateAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Dimen.spacing(.small)) {
            HStack(spacing: Dimen.spacing(.small)) {
                CalculatorKeyButton(.number(.seven), action: appendKeyAction)
                CalculatorKeyButton(.number(.eight), action: appendKeyAction)
                CalculatorKeyButton(.number(.nine), action: appendKeyAction)
                CalculatorErrorButton(action: deleteAction) {
                    Text("DEL")
                }
                CalculatorErrorButton(action: clearAllAction) {
                    Text("AC")
                }
            }
            HStack(spacing: Dimen.spacing(.small)) {
                CalculatorKeyButton(.number(.four), action: appendKeyAction)
                CalculatorKeyButton(.number(.five), action: appendKeyAction)
                CalculatorKeyButton(.number(.six), action: appendKeyAction)
                CalculatorKeyButton(.operator(.multiply), action: appendKeyAction)
                CalculatorKeyButton(.operator(.divide), action: appendKeyAction)
            }
            HStack(spacing: Dimen.spacing(.small)) {
                CalculatorKeyButton(.number(.one), action: appendKeyAction)
                CalculatorKeyButton(.number(.two), action: appendKeyAction)
                CalculatorKeyButton(.number(.three), action: appendKeyAction)
                CalculatorKeyButton(.operator(.plus), action: appendKeyAction)
                CalculatorKeyButton(.operator(.minus), action: appendKeyAction)
            }
            HStack(spacing: Dimen.spacing(.small)) {
                CalculatorKeyButton(.number(.zero), action: appendKeyAction)
                CalculatorKeyButton(.number(.dot), action: appendKeyAction)
                if !isFnSelected {
                    CalculatorKeyButton(.function(.exponent), action: appendKeyAction)
                } else {
                    CalculatorKeyButton(.function(.pi), action: appendKeyAction)
                }
                CalculatorKeyButton(.variable(.answer), action: appendKeyAction)
                CalculatorPrimaryButton(action: calculateAction) {
                    Text("EXE")
                }
            }
        }
    }
}

struct CalculatorFunctionControlPanelView: View {
    var isFnSelected: Bool
    var appendKeyAction: (_ key: CalculatorKey) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Dimen.spacing(.small)) {
            if !isFnSelected {
                HStack(spacing: Dimen.spacing(.small)) {
                    CalculatorKeyButton(.function(.power), action: appendKeyAction)
                    CalculatorKeyButton(.function(.square), action: appendKeyAction)
                    CalculatorKeyButton(.function(.cube), action: appendKeyAction)
                    CalculatorKeyButton(.function(.log), action: appendKeyAction)
                    CalculatorKeyButton(.function(.naturalLog), action: appendKeyAction)
                }
                HStack(spacing: Dimen.spacing(.small)) {
                    CalculatorKeyButton(.bracket(.openBracket), action: appendKeyAction)
                    CalculatorKeyButton(.bracket(.closeBracket), action: appendKeyAction)
                    CalculatorKeyButton(.function(.sin), action: appendKeyAction)
                    CalculatorKeyButton(.function(.cos), action: appendKeyAction)
                    CalculatorKeyButton(.function(.tan), action: appendKeyAction)
                }
            } else {
                HStack(spacing: Dimen.spacing(.small)) {
                    CalculatorKeyButton(.function(.root), action: appendKeyAction)
                    CalculatorKeyButton(.function(.squareRoot), action: appendKeyAction)
                    CalculatorKeyButton(.function(.cubeRoot), action: appendKeyAction)
                    CalculatorKeyButton(.function(.powerOfTen), action: appendKeyAction)
                    CalculatorKeyButton(.function(.exponential), action: appendKeyAction)
                }
                HStack(spacing: Dimen.spacing(.small)) {
                    CalculatorKeyButton(.function(.factorial), action: appendKeyAction)
                    CalculatorKeyButton(.function(.inverseFraction), action: appendKeyAction)
                    CalculatorKeyButton(.function(.inverseSin), action: appendKeyAction)
                    CalculatorKeyButton(.function(.inverseCos), action: appendKeyAction)
                    CalculatorKeyButton(.function(.inverseTan), action: appendKeyAction)
                }
            }
        }
    }
}

struct CalculatorVariableControlPanelView: View {
    var isFnSelected: Bool
    var isSaveToSelected: Bool
    var appendKeyAction: (_ key: CalculatorKey) -> Void
    var calculateToVariableAction: (_ variable: CalculatorVariable) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Dimen.spacing(.small)) {
            if !isFnSelected {
                if !isSaveToSelected {
                    HStack(spacing: Dimen.spacing(.small)) {
                        CalculatorKeyButton(.variable(.a), action: appendKeyAction)
                        CalculatorKeyButton(.variable(.b), action: appendKeyAction)
                        CalculatorKeyButton(.variable(.c), action: appendKeyAction)
                        Spacer().frame(maxWidth: .infinity)
                        Spacer().frame(maxWidth: .infinity)
                    }
                } else {
                    HStack(spacing: Dimen.spacing(.small)) {
                        CalculatorVariableCalculationButton(.a, action: calculateToVariableAction)
                        CalculatorVariableCalculationButton(.b, action: calculateToVariableAction)
                        CalculatorVariableCalculationButton(.c, action: calculateToVariableAction)
                        Spacer().frame(maxWidth: .infinity)
                        Spacer().frame(maxWidth: .infinity)
                    }
                }
            } else {
                if !isSaveToSelected {
                    HStack(spacing: Dimen.spacing(.small)) {
                        CalculatorKeyButton(.variable(.d), action: appendKeyAction)
                        CalculatorKeyButton(.variable(.x), action: appendKeyAction)
                        CalculatorKeyButton(.variable(.y), action: appendKeyAction)
                        Spacer().frame(maxWidth: .infinity)
                        Spacer().frame(maxWidth: .infinity)
                    }
                } else {
                    HStack(spacing: Dimen.spacing(.small)) {
                        CalculatorVariableCalculationButton(.d, action: calculateToVariableAction)
                        CalculatorVariableCalculationButton(.x, action: calculateToVariableAction)
                        CalculatorVariableCalculationButton(.y, action: calculateToVariableAction)
                        Spacer().frame(maxWidth: .infinity)
                        Spacer().frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}

struct CalculatorControlPanelView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorControlPanelView(appendKeyAction: { _ in }, deleteAction: {}, clearAllAction: {}, calculateAction: {}, functionEnabled: true, angle: .constant(.degree), variableEnabled: true, isSaveToEnabled: true, calculateToVariableAction: { _ in })
                .previewDisplayName("Full Control Panel")
            CalculatorControlPanelView(appendKeyAction: { _ in }, deleteAction: {}, clearAllAction: {}, calculateAction: {}, functionEnabled: false, angle: .constant(.degree), variableEnabled: false, calculateToVariableAction: { _ in })
                .previewDisplayName("Basic Control Panel")

            CalculatorBasicControlPanelView(isFnSelected: false, appendKeyAction: { _ in }, deleteAction: {}, clearAllAction: {}, calculateAction: {})
                .previewDisplayName("Number Control Panel")
            CalculatorFunctionControlPanelView(isFnSelected: false, appendKeyAction: { _ in })
                .previewDisplayName("Function Control Panel")
            CalculatorVariableControlPanelView(isFnSelected: false, isSaveToSelected: false, appendKeyAction: { _ in }, calculateToVariableAction: { _ in })
                .previewDisplayName("Variable Control Panel")
        }
    }
}
