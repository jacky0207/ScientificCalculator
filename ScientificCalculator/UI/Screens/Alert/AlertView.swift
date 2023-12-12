//
//  AlertView.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI
import Combine

struct AlertParams {
    var title: String
    var message: String

    init(
        title: String,
        message: String = ""
    ) {
        self.title = title
        self.message = message
    }
}

extension AlertParams {
    static var none: AlertParams {
        return AlertParams(title: "", message: "")
    }
}

extension View {
    func alert(for params: AlertParams, isPresented: Binding<Bool>) -> some View {
        self.alert(params.title, isPresented: isPresented, actions: {
            Button("ok", action: {})
        }, message: {
            Text(params.message)
        })
    }
}
