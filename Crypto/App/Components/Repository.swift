//
//  Repository.swift
//  Crypto
//
//  Created by Aleksander Popek on 10/05/2021.
//

import Foundation

protocol Repository {
    associatedtype T
    
    func get() -> T?
}
