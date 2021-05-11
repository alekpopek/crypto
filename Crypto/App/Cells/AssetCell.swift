//
//  CryptoCell.swift
//  Crypto
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit
import SDWebImage

class CryptoCell: UITableViewCell, Reusable {
    private(set) lazy var symbolLabel: UILabel = makeSymbolLabel()
    private(set) lazy var nameLabel: UILabel = makeNameLabel()
    private(set) lazy var priceLabel: UILabel = makePriceLabel()
    private(set) lazy var iconImageView: UIImageView = makeIconImageView()

    private(set) lazy var changeLabel: UILabel = makeChangeLabel()
    private(set) lazy var changeBackground: UIView = makeChangeBackground()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: Asset) {
        symbolLabel.text = item.symbol
        nameLabel.text = item.name
        iconImageView.sd_setImage(with: item.iconUrl, placeholderImage: Style.placeholderIcon)
        
        let priceFormatter = NumberFormatter.currencyFormatter(precission: item.precision)
        priceLabel.text = priceFormatter.string(from: NSNumber(value: item.avaragePrice))
        priceLabel.textColor = item.change <= 0
            ? Style.colorRed
            : Style.colorGreen

        changeLabel.text = NumberFormatter.percentageFormatter.string(from: NSNumber(value: item.change / 100))
        changeBackground.backgroundColor = item.change <= 0
            ? Style.colorRed
            : Style.colorGreen
    }
}

// MARK: - Setup

private extension CryptoCell {
    func setupViews() {
        contentView.backgroundColor = .clear
        [symbolLabel, nameLabel, priceLabel, iconImageView, changeBackground].forEach(addSubview)
        changeBackground.addSubview(changeLabel)
    }
    
    func setupConstraints() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Style.padding10)
            $0.top.bottom.equalToSuperview().inset(Style.padding16)
            $0.width.height.equalTo(Style.iconSize)
        }
        symbolLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(Style.padding10)
            $0.top.equalToSuperview().offset(Style.padding16)
            $0.height.equalTo(Style.size20)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(Style.padding10)
            $0.top.equalTo(symbolLabel.snp.bottom)
            $0.height.equalTo(Style.size18)
        }
        changeBackground.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(Style.padding10)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(Style.priceChangeWidth)
            $0.height.equalTo(Style.priceChangeHeight)
        }
        priceLabel.snp.makeConstraints {
            $0.trailing.equalTo(changeBackground.snp.leading).offset(-Style.padding10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(Style.size24)
        }
        changeLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Factory

private extension CryptoCell {
    func makeSymbolLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = Style.colorPrimary
        return label
    }

    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        label.textColor = Style.colorSecondary
        return label
    }

    func makePriceLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        label.textAlignment = .right
        return label
    }

    func makeChangeLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = Style.colorWhite
        label.textAlignment = .center
        return label
    }

    func makeIconImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode =  .scaleAspectFit
        return imageView
    }

    func makeChangeBackground() -> UIView {
        let view = UIView()
        view.layer.cornerRadius =  Style.priceChangeCornerRadius
        return view
    }
}
