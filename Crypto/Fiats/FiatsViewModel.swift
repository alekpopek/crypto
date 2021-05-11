//
//  FiatsViewModel.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

final class FiatsViewModel: ViewModelProtocol {

    private let repository: LocalRepository = LocalRepository()
    
    var items: [Fiat] = []
    
    func getFiats(_ completion: () -> ()) {
        guard let localData = repository.get() else {
            return
        }
        items = localData.fiats
            .filter {
                $0.hasWallets
            }.sorted {
                $0.name > $1.name
            }
        completion()
    }
}
