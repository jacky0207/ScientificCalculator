//
//  ScientificCalculatorApp.swift
//  ScientificCalculator
//
//  Created by Jacky Lam on 2023-11-17.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if CommandLine.arguments.contains("testing") {
            UIApplication.shared.connectedScenes
                .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                .last?.layer
                .speed = 100
            UIView.setAnimationsEnabled(false)
            try! CoreDataHelper.shared.deleteAll()
        }
        return true
    }
}

@main
struct ScientificCalculatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let diContainer = DIContainer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environment(\.defaultMinListRowHeight, 1)  // set list row min height to all pages, having bug if min height is 0
                .environment(\.diContainer, diContainer)
        }
    }
}
