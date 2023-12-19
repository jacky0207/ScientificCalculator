//
//  CalculatorHomeView.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-12.
//

import SwiftUI

struct CalculatorHomeView: View, CalculatorHomeProtocol {
    @ObservedObject var viewModel: CalculatorHomeViewModel
    @State private var isShowSettings = false
    @State private var isShowProgram = false

    var body: some View {
        VStack {
            CalculatorHeaderView(
                isShowSettings: $isShowSettings,
                isShowProgram: $isShowProgram
            )
            CalculatorViewContent()
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("calculatorHome")
        .background(ColorStyle.background.color)
        .sheet(isPresented: $isShowSettings) {
            EmptyView()
        }
        .sheet(isPresented: $isShowProgram) {
            EmptyView()
        }
    }
}

struct CalculatorHeaderView: View {
    @Binding var isShowSettings: Bool
    @Binding var isShowProgram: Bool

    var body: some View {
        HStack {
            SettingsButton()
            Spacer()
            ProgramButton()
        }
        .padding(.horizontal, Dimen.spacing(.large))
        .padding(.top, Dimen.spacing(.normal))
    }

    func SettingsButton() -> some View {
        Button(action: { isShowSettings.toggle() }) {
            Image("settings")
                .resizable()
                .renderingMode(.template)
                .imageStyle(ImageStyle.Icon())
        }
    }

    func ProgramButton() -> some View {
        Button(action: { isShowProgram.toggle() }) {
            Image("coding")
                .resizable()
                .renderingMode(.template)
                .imageStyle(ImageStyle.Icon())
        }
    }
}

struct CalculatorViewContent: View {
    var body: some View {
        CalculatorView(
            functionEnabled: true,
            variableEnabled: true,
            saveToEnabled: true,
            historyEnabled: true
        )
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct CalculatorHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorHomeView(viewModel: CalculatorHomeViewModel(diContainer: DIContainer()))
    }
}
