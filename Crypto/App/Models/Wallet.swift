//
//  Wallet.swift
//  Crypto
//
//  Created by Aleksander Popek on 10/05/2021.
//

import Foundation

struct Wallet: Decodable {
    var identifier: String
    var name: String
    var symbol: String
    var balance: Double
    var iconUrl: URL?
    var isDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case attributes = "attributes"
        case name = "name"
        case symbol = "cryptocoin_symbol"
        case balance = "balance"
        case isDefault = "is_default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let attributes = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .attributes)

        identifier = try container.decode(String.self, forKey: .identifier)
        name = try attributes.decode(String.self, forKey: .name)
        symbol = try attributes.decode(String.self, forKey: .symbol)
        isDefault = try attributes.decode(Bool.self, forKey: .isDefault)
        iconUrl = ImageService.cryptoIconUrl(forSymbol: symbol)

        // Price conversions
        let amount = try attributes.decode(String.self, forKey: .balance)
        if let doubleAmount = Double(amount) {
            balance = doubleAmount
        } else {
            balance = 0.0
        }
    }
}
