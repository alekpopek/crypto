//
//  TabPageViewModel.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

final class TabPageViewModel: ViewModelProtocol {
    var selectedIndex: Int = 0
    var shouldScroll: Bool = true
}
