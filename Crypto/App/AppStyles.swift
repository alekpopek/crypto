//
//  AppStyles.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

// TODO: Switch to SwiftGen

struct Style {
    static let colorBackground = UIColor.systemBackground
    static let colorPrimary = UIColor.label
    static let colorSecondary = UIColor.secondaryLabel
    static let colorTertiary = UIColor.tertiaryLabel
    static let colorQuaternary = UIColor.quaternaryLabel
    
    static let colorWhite = UIColor.white
    
    static let colorGreen = UIColor(red: 46/255, green: 189/255, blue: 133/255, alpha: 1.0)
    static let colorRed = UIColor(red: 245/255, green: 70/255, blue: 93/255, alpha: 1.0)
}

// MARK: - Sizes and paddings

extension Style {
    static let tabsHeight: CGFloat = 50.0
    static let sliderHeight: CGFloat = 2.0
    static let separatorHeight: CGFloat = 1.0
    static let minimumTabWidth: CGFloat = 120.0
    
    static let priceChangeCornerRadius: CGFloat = 3.0
    static let priceChangeHeight: CGFloat = 36.0
    static let priceChangeWidth: CGFloat = 86.0
    static let iconSize: CGFloat = 30.0

    static let padding16: CGFloat = 16.0
    static let padding10: CGFloat = 10.0

    static let size24: CGFloat = 24.0
    static let size20: CGFloat = 20.0
    static let size18: CGFloat = 18.0
}

// MARK: - Images

extension Style {
    static let placeholderIcon = UIImage(named: "placeholderIcon")
    static let iconList = UIImage(named: "iconList")
    static let iconWallet = UIImage(named: "iconWallet")
}
