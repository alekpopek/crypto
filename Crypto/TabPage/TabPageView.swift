//
//  TabPageView.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

final class TabPageView: ContentView {
    
    private(set) lazy var mainView: UIView = makeMainView()
    private(set) lazy var tabsView: TabsView = makeTabsView()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(tabsView)
        addSubview(mainView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        tabsView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(Style.tabsHeight)
        }
        mainView.snp.makeConstraints {
            $0.top.equalTo(tabsView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}

// MARK: - Factory

private extension TabPageView {
    func makeTabsView() -> TabsView {
        let view = TabsView()
        view.backgroundColor = backgroundColor
        return view
    }

    func makeMainView() -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
}
