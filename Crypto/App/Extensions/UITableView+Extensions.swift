//
//  UITableView+Extensions.swift
//  Crypto
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation

import UIKit

extension UITableView {
    func register<T: UITableViewCell & Reusable>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
