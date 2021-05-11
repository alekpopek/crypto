//
//  CommoditiesView.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

final class CommoditiesView: ContentView {
    
    private(set) lazy var tableView: UITableView = makeTableView()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(tableView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Factory

private extension CommoditiesView {
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(CryptoCell.self)
        return tableView
    }
}
