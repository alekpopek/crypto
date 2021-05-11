//
//  AssetsCoordinator.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

final class AssetsCoordinator: Coordinator {
    let navigationController: NavigationController
    
    private(set) lazy var commoditiesViewController: CommoditiesViewController = makeCommoditiesViewController()
    private(set) lazy var cryptocoinsViewController: CryptocoinsViewController = makeCryptocoinsViewController()
    private(set) lazy var fiatsViewController: FiatsViewController = makeFiatsViewController()
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        showAssets()
    }
}

// MARK: - Preenting ViewControllers

private extension AssetsCoordinator {
    func showAssets() {
        let viewModel = TabPageViewModel()
        let viewController = TabPageViewController(
            viewModel: viewModel
        )
        viewController.title = Strings.assets
        viewController.viewControllers = [
            cryptocoinsViewController,
            commoditiesViewController,
            fiatsViewController
        ]
        navigationController.setViewControllers([viewController], animated: false)
    }
}

// MARK: - Factory

private extension AssetsCoordinator {
    func makeCommoditiesViewController() -> CommoditiesViewController {
        let viewModel = CommoditiesViewModel()
        let viewController = CommoditiesViewController(
            viewModel: viewModel
        )
        viewController.title = Strings.commodities
        return viewController
    }

    func makeCryptocoinsViewController() -> CryptocoinsViewController {
        let viewModel = CryptocoinsViewModel()
        let viewController = CryptocoinsViewController(
            viewModel: viewModel
        )
        viewController.title = Strings.cryptocoins
        return viewController
    }

    func makeFiatsViewController() -> FiatsViewController {
        let viewModel = FiatsViewModel()
        let viewController = FiatsViewController(
            viewModel: viewModel
        )
        viewController.title = Strings.fiats
        return viewController
    }
}
