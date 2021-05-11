//
//  AppDelegate.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit
import SDWebImageSVGCoder

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        AppAppearance.configure()
        
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let coordinator = AppCoordinator(window: window)
        coordinator.start()
        return true
    }
}
