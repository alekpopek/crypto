//
//  LocalData.swift
//  Crypto
//
//  Created by Aleksander Popek on 10/05/2021.
//

import Foundation

struct LocalData: Decodable {
    var cryptocoins: [Asset]
    var commodities: [Asset]
    var fiats: [Fiat]
    var wallets: [Wallet]
    var commodityWallets: [Wallet]
    var fiatWallets: [FiatWallet]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case attributes = "attributes"
        case cryptocoins = "cryptocoins"
        case commodities = "commodities"
        case fiats = "fiats"
        case wallets = "wallets"
        case commodityWallets = "commodity_wallets"
        case fiatWallets = "fiatwallets"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        let attributes = try data.nestedContainer(keyedBy: CodingKeys.self, forKey: .attributes)

        cryptocoins = try attributes.decode([Asset].self, forKey: .cryptocoins)
        commodities = try attributes.decode([Asset].self, forKey: .commodities)
        fiats = try attributes.decode([Fiat].self, forKey: .fiats)
        wallets = try attributes.decode([Wallet].self, forKey: .wallets)
        commodityWallets = try attributes.decode([Wallet].self, forKey: .commodityWallets)
        fiatWallets = try attributes.decode([FiatWallet].self, forKey: .fiatWallets)
    }    
}
