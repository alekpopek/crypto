//
//  AppCoordinator.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

class AppCoordinator: Coordinator {

    private(set) lazy var assetsNavigationController = makeAssetsNavigationController()
    private(set) lazy var walletsNavigationController = makeWalletsNavigationController()

    private(set) lazy var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            assetsNavigationController,
            walletsNavigationController
        ]
        return tabBarController
    }()
    
    var window: UIWindow?
     
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        loadAssetsCoordinator()
        loadWalletsCoordinator()
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

// MARK: - Coordinators

private extension AppCoordinator {
    func loadAssetsCoordinator() {
        let coordinator = AssetsCoordinator(navigationController: assetsNavigationController)
        load(coordinator)
    }
    
    func loadWalletsCoordinator() {
        let coordinator = WalletsCoordinator(navigationController: walletsNavigationController)
        load(coordinator)
    }
}

// MARK: - Factory

private extension AppCoordinator {
    func makeAssetsNavigationController() -> NavigationController {
        makeNavigationController(
            title: Strings.assets,
            image: Style.iconList
        )
    }
    
    func makeWalletsNavigationController() -> NavigationController {
        makeNavigationController(
            title: Strings.wallets,
            image: Style.iconWallet
        )
    }

    func makeNavigationController(title: String, image: UIImage?) -> NavigationController {
        let navigationController: NavigationController = .init()
        navigationController.tabBarItem = .init(
            title: title,
            image: image,
            selectedImage: nil
        
        )
        return navigationController
    }
}
