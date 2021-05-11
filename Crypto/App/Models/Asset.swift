//
//  Asset.swift
//  Crypto
//
//  Created by Aleksander Popek on 10/05/2021.
//

import Foundation

struct Asset: Decodable {
    var identifier: String
    var name: String
    var symbol: String
    var iconUrl: URL?
    var avaragePrice: Double
    var precision: Int
    var change: Double
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case attributes = "attributes"
        case name = "name"
        case symbol = "symbol"
        case iconUrl = "logo"
        case avaragePrice = "avg_price"
        case precision = "precision_for_fiat_price"
        case change = "change_24h"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let attributes = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .attributes)

        identifier = try container.decode(String.self, forKey: .identifier)
        name = try attributes.decode(String.self, forKey: .name)
        symbol = try attributes.decode(String.self, forKey: .symbol)
        precision = try attributes.decode(Int.self, forKey: .precision)
        
        // Price conversions
        let price = try attributes.decode(String.self, forKey: .avaragePrice)
        if let doublePrice = Double(price) {
            avaragePrice = doublePrice
        } else {
            avaragePrice = 0.0
        }

        // Price change conversions
        let priceChange = try attributes.decode(String.self, forKey: .change)
        if let doublePriceChange = Double(priceChange) {
            change = doublePriceChange
        } else {
            change = 0.0
        }
        
        // Icon path conversion
        let iconPath = try attributes.decode(String.self, forKey: .iconUrl)
        iconUrl = URL(string: iconPath)
    }
}
