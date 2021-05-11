//
//  CryptocoinsViewModel.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

final class CryptocoinsViewModel: ViewModelProtocol {
    
    private let repository: LocalRepository = LocalRepository()
    
    var items: [Asset] = []
    
    func getCryptocoins(_ completion: () -> ()) {
        guard let localData = repository.get() else {
            return
        }
        items = localData.cryptocoins.sorted {
            $0.change > $1.change
        }
        completion()
    }
}
