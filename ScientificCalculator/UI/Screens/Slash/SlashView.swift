//
//  SlashView.swift
//  NASA Data
//
//  Created by Jacky Lam on 2023-08-10.
//

import SwiftUI

struct SlashView: View {
    var logoWidth: CGFloat = 192.0
    var fadeOutMilliseconds: Int = 400

    var body: some View {
        BodyView(
            title: "",
            content: content
        )
        .onAppear(perform: fadeOut)
    }

    func content() -> some View {
        Image("logo")
            .resizable()
            .frame(width: logoWidth, height: logoWidth)
    }
    
    func fadeOut() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(fadeOutMilliseconds)) {
            withAnimation {
                AppState.shared.launchState = .main
            }
        }
    }
}

struct SlashView_Previews: PreviewProvider {
    static var previews: some View {
        SlashView()
    }
}
