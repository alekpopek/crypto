//
//  WalletsOverviewViewController.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

final class WalletsOverviewViewController: ViewController<WalletsOverviewView, WalletsOverviewViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getWallets { [weak self] in
            self?.contentView.tableView.reloadData()
        }
    }
}

// MARK: - Setup

private extension WalletsOverviewViewController {
    func setupViews() {
        contentView.tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource

extension WalletsOverviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        let cell: WalletCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: item)
        return cell
    }
}
