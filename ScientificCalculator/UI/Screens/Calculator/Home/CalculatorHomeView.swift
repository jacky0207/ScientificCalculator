//
//  CalculatorHomeView.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-12-12.
//

import SwiftUI

struct CalculatorHomeView: View, CalculatorHomeProtocol {
    @ObservedObject var viewModel: CalculatorHomeViewModel

    var body: some View {
        BodyView(
            title: "",
            toolbar: {},
            content: content
        )
    }

    func content() -> some View {
        VStack {
            CalculatorView()
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct CalculatorHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorHomeView(viewModel: CalculatorHomeViewModel(diContainer: DIContainer()))
    }
}
