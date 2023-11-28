//
//  BuildConfig+Plist.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

extension BuildConfig {
    var appName: String {
        return string(for: "CFBundleName")
    }

    var appVersion: String {
        return string(for: "CFBundleShortVersionString")
    }

    var bottomBannerUnitId: String {
        return string(for: "GADBottomBannerIdentifier")
    }
}
