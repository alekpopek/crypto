//
//  CommodityWalletsViewModel.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

final class CommodityWalletsViewModel: ViewModelProtocol {
    private let repository: LocalRepository = LocalRepository()
    
    var items: [Wallet] = []
    
    func getCommodityWallets(_ completion: () -> ()) {
        guard let localData = repository.get() else {
            return
        }
        items = localData.commodityWallets
            .sorted {
                $0.balance > $1.balance
            }
        completion()
    }
}
