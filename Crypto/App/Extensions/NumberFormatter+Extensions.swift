//
//  NumberFormatter+Extensions.swift
//  Crypto
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation

extension NumberFormatter {
    static func currencyFormatter(precission: Int = 2) -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.minimumFractionDigits = precission
        numberFormatter.maximumFractionDigits = precission
        numberFormatter.locale = Locale.current
        numberFormatter.currencySymbol = Locale.current.currencySymbol
        return numberFormatter
    }

    static var percentageFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.locale = Locale.current
        return numberFormatter
    }
}
