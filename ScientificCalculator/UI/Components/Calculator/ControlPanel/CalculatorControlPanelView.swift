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

    @State private var isShiftSelected = false
    @Binding var angle: CalculatorAngle
    var functionEnabled = true
    var variableEnabled = false

    var body: some View {
        VStack(spacing: Dimen.spacing(.small)) {
            CalculatorActionControlPanelView(
                isShiftSelected: $isShiftSelected,
                angle: $angle
            )
            if variableEnabled {
                CalculatorVariableControlPanelView(
                    isShiftSelected: isShiftSelected,
                    appendKeyAction: appendKeyAction
                )
            }
            if functionEnabled {
                CalculatorFunctionControlPanelView(
                    isShiftSelected: isShiftSelected,
                    appendKeyAction: appendKeyAction
                )
            }
            CalculatorBasicControlPanelView(
                isShiftSelected: isShiftSelected,
                appendKeyAction: appendKeyAction,
                deleteAction: deleteAction,
                clearAllAction: clearAllAction,
                calculateAction: calculateAction
            )
        }
    }
}

struct CalculatorActionControlPanelView: View {
    @Binding var isShiftSelected: Bool
    @Binding var angle: CalculatorAngle

    var body: some View {
        VStack(alignment: .leading, spacing: Dimen.spacing(.small)) {
            HStack(spacing: Dimen.spacing(.small)) {
                CalculatorSecondaryButton(action: { isShiftSelected.toggle() }) {
                    Text("Shift")
                }
                CalculatorSecondaryButton(action: { angle.toggle() }) {
                    Text(angle.rawValue)
                }
                Spacer().frame(maxWidth: .infinity)
                Spacer().frame(maxWidth: .infinity)
            }
        }
    }
}

struct CalculatorBasicControlPanelView: View {
    var isShiftSelected: Bool
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
                if !isShiftSelected {
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
    var isShiftSelected: Bool
    var appendKeyAction: (_ key: CalculatorKey) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Dimen.spacing(.small)) {
            if !isShiftSelected {
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
    var isShiftSelected: Bool
    var appendKeyAction: (_ key: CalculatorKey) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Dimen.spacing(.small)) {
            if !isShiftSelected {
                HStack(spacing: Dimen.spacing(.small)) {
                    CalculatorKeyButton(.variable(.a), action: appendKeyAction)
                    CalculatorKeyButton(.variable(.b), action: appendKeyAction)
                    CalculatorKeyButton(.variable(.c), action: appendKeyAction)
                    Spacer().frame(maxWidth: .infinity)
                    Spacer().frame(maxWidth: .infinity)
                }
            } else {
                HStack(spacing: Dimen.spacing(.small)) {
                    CalculatorKeyButton(.variable(.d), action: appendKeyAction)
                    CalculatorKeyButton(.variable(.x), action: appendKeyAction)
                    CalculatorKeyButton(.variable(.y), action: appendKeyAction)
                    Spacer().frame(maxWidth: .infinity)
                    Spacer().frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct CalculatorControlPanelView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorControlPanelView(appendKeyAction: { _ in }, deleteAction: {}, clearAllAction: {}, calculateAction: {}, angle: .constant(.degree), functionEnabled: true, variableEnabled: true)
                .previewDisplayName("Full Control Panel")
            CalculatorControlPanelView(appendKeyAction: { _ in }, deleteAction: {}, clearAllAction: {}, calculateAction: {}, angle: .constant(.degree), functionEnabled: false, variableEnabled: false)
                .previewDisplayName("Basic Control Panel")

            CalculatorBasicControlPanelView(isShiftSelected: false, appendKeyAction: { _ in }, deleteAction: {}, clearAllAction: {}, calculateAction: {})
                .previewDisplayName("Number Control Panel")
            CalculatorFunctionControlPanelView(isShiftSelected: false, appendKeyAction: { _ in })
                .previewDisplayName("Function Control Panel")
            CalculatorVariableControlPanelView(isShiftSelected: false, appendKeyAction: { _ in })
                .previewDisplayName("Variable Control Panel")
        }
    }
}
