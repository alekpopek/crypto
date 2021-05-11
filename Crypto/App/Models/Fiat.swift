//
//  Fiat.swift
//  Crypto
//
//  Created by Aleksander Popek on 10/05/2021.
//

import Foundation

struct Fiat: Decodable {
    var identifier: String
    var name: String
    var symbol: String
    var hasWallets: Bool
    var iconUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case attributes = "attributes"
        case name = "name"
        case symbol = "symbol"
        case iconUrl = "logo"
        case hasWallets = "has_wallets"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let attributes = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .attributes)

        identifier = try container.decode(String.self, forKey: .identifier)
        name = try attributes.decode(String.self, forKey: .name)
        symbol = try attributes.decode(String.self, forKey: .symbol)
        hasWallets = try attributes.decode(Bool.self, forKey: .hasWallets)

        // Icon path conversion
        let iconPath = try attributes.decode(String.self, forKey: .iconUrl)
        iconUrl = URL(string: iconPath)
    }
}
