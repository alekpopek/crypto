//
//  WalletsCoordinator.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

final class WalletsCoordinator: Coordinator {
    let navigationController: NavigationController
    
    private(set) lazy var commodityWalletsViewController: CommodityWalletsViewController = makeCommodityWalletsViewController()
    private(set) lazy var walletsOverviewViewController: WalletsOverviewViewController = makeWalletsOverviewViewController()
    private(set) lazy var fiatWalletsViewController: FiatWalletsViewController = makeFiatWalletsViewController()

    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        showWallets()
    }
}

// MARK: - Preenting ViewControllers

private extension WalletsCoordinator {
    func showWallets() {
        let viewModel = TabPageViewModel()
        let viewController = TabPageViewController(
            viewModel: viewModel
        )
        viewController.title = Strings.wallets
        viewController.viewControllers = [
            walletsOverviewViewController,
            commodityWalletsViewController,
            fiatWalletsViewController
        ]
        navigationController.setViewControllers([viewController], animated: false)
    }
}

// MARK: - Factory

private extension WalletsCoordinator {
    func makeCommodityWalletsViewController() -> CommodityWalletsViewController {
        let viewModel = CommodityWalletsViewModel()
        let viewController = CommodityWalletsViewController(
            viewModel: viewModel
        )
        viewController.title = Strings.commodity
        return viewController
    }

    func makeWalletsOverviewViewController() -> WalletsOverviewViewController {
        let viewModel = WalletsOverviewViewModel()
        let viewController = WalletsOverviewViewController(
            viewModel: viewModel
        )
        viewController.title = Strings.cryptocoins
        return viewController
    }

    func makeFiatWalletsViewController() -> FiatWalletsViewController {
        let viewModel = FiatWalletsViewModel()
        let viewController = FiatWalletsViewController(
            viewModel: viewModel
        )
        viewController.title = Strings.fiat
        return viewController
    }
}
