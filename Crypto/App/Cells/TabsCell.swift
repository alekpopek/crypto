//
//  TabsCell.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

class TabsCell: UICollectionViewCell, Reusable {
    private(set) lazy var titleLabel: UILabel = makeTitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, isSelected: Bool) {
        titleLabel.text = title
        titleLabel.textColor = isSelected
            ? Style.colorPrimary
            : Style.colorSecondary
        titleLabel.font = UIFont.systemFont(
            ofSize: 14.0,
            weight: isSelected
                ? .semibold
                : .regular
        )
    }
}

// MARK: - Setup

private extension TabsCell {
    func setupViews() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Factory

private extension TabsCell {
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = Style.colorSecondary
        label.textAlignment = .center
        return label
    }
}
