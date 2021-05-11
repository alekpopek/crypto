//
//  Collection+Extensions.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

extension Collection {    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

