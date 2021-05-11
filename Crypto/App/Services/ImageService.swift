//
//  ImageSwervice.swift
//  Crypto
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation

protocol ImageServieProtocol {
    static func cryptoIconUrl(forSymbol symbol: String) -> URL?
    static func fiatIconUrl(forSymbol symbol: String) -> URL?
}

struct ImageService: ImageServieProtocol {
    static func cryptoIconUrl(forSymbol symbol: String) -> URL? {
        URL(string: String(format: "%@%@.svg", Constants.cryptoImagePath, symbol.lowercased()))
    }

    static func fiatIconUrl(forSymbol symbol: String) -> URL? {
        URL(string: String(format: "%@%@.svg", Constants.fiatImagePath, symbol.lowercased()))
    }
}
