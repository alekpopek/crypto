//
//  FiatCell.swift
//  Crypto
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit
import SDWebImage

class FiatCell: UITableViewCell, Reusable {
    private(set) lazy var symbolLabel: UILabel = makeSymbolLabel()
    private(set) lazy var nameLabel: UILabel = makeNameLabel()
    private(set) lazy var iconImageView: UIImageView = makeIconImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: Fiat) {
        symbolLabel.text = item.symbol
        nameLabel.text = item.name
        iconImageView.sd_setImage(with: item.iconUrl, placeholderImage: Style.placeholderIcon)
    }
}

// MARK: - Setup

private extension FiatCell {
    func setupViews() {
        contentView.backgroundColor = .clear
        [symbolLabel, nameLabel, iconImageView].forEach(addSubview)
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
    }
}

// MARK: - Factory

private extension FiatCell {
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

    func makeIconImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode =  .scaleAspectFit
        return imageView
    }
}
