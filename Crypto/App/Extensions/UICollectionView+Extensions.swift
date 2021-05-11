//
//  UICollectionView+Extensions.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell & Reusable>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
