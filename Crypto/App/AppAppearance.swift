//
//  AppAppearance.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

final class AppAppearance {
    static func configure() {
        configureNavigationBar()
        configureTabBar()
    }
}

// MARK: - Configuration

private extension AppAppearance {
    static func configureNavigationBar() {
        UINavigationBar.appearance().backgroundColor = Style.colorBackground
        UINavigationBar.appearance().isTranslucent = false
    }
    
    static func configureTabBar() {
        UITabBar.appearance().barTintColor = Style.colorBackground
        UITabBar.appearance().tintColor = Style.colorGreen
        UITabBar.appearance().unselectedItemTintColor = Style.colorSecondary
        UITabBarItem.appearance().setTitleTextAttributes([
            .foregroundColor: Style.colorPrimary
        ], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([
            .foregroundColor: Style.colorSecondary
        ], for: .normal)
    }
}
