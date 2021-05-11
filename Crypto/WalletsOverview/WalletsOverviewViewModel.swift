//
//  WalletsOverviewViewModel.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

final class WalletsOverviewViewModel: ViewModelProtocol {
    private let repository: LocalRepository = LocalRepository()
    
    var items: [Wallet] = []
    
    func getWallets(_ completion: () -> ()) {
        guard let localData = repository.get() else {
            return
        }
        items = localData.wallets
            .sorted {
                $0.balance > $1.balance
            }
        completion()
    }
}
