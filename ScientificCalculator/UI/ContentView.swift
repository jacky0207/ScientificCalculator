//
//  ContentView.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-16.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.diContainer) var diContainer
    @ObservedObject var appState = AppState.shared

    var body: some View {
        Group {
            switch appState.launchState {
            case .slash:
                SlashView()
            case .main:
                CalculatorHomeView(viewModel: CalculatorHomeViewModel(diContainer: diContainer))
            }
        }
        .alert(for: appState.alertParams, isPresented: $appState.isAlertPresented)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
