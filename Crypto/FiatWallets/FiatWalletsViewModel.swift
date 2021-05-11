//
//  FiatWalletsViewModel.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

final class FiatWalletsViewModel: ViewModelProtocol {
    private let repository: LocalRepository = LocalRepository()
    
    var items: [FiatWallet] = []
    
    func getFiatWallets(_ completion: () -> ()) {
        guard let localData = repository.get() else {
            return
        }
        items = localData.fiatWallets
            .sorted {
                $0.balance > $1.balance
            }
        completion()
    }
}
