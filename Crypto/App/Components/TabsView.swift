//
//  TabsView.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

protocol TabsViewDelegate: AnyObject {
    func tabsViewDelegate(didSelectItemAtIndex index: Int)
}

class TabsView: ContentView {
    
    private(set) lazy var collectionView: UICollectionView = makeCollectionView()
    private(set) lazy var bottomSlider: UIView = makeBottomSlider()
    private(set) lazy var separator: UIView = makeSeparator()
    
    private var tabs: [Tab] = []
    
    private var selectedIndex: Int = 0
    private var collectionViewOffset: CGFloat = 0
    private var sliderWidth: CGFloat {
        if tabs.count < 4 {
            return collectionView.frame.width / CGFloat(tabs.count)
        }
        return Style.minimumTabWidth
    }
    
    weak var delegate: TabsViewDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bottomSlider.frame.size.width = sliderWidth
    }

    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .clear

        addSubview(collectionView)
        addSubview(bottomSlider)
        addSubview(separator)

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        bottomSlider.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(Style.sliderHeight)
        }
        separator.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(Style.separatorHeight)
        }
    }
    
    func configure(withTabs tabs: [Tab]) {
        self.tabs = tabs
        collectionView.reloadData()        
    }
    
    /// Used to update bottom slider posiiton
    /// - Parameter x: slider position
    func updateSliderPosition(x: CGFloat) {
        bottomSlider.frame.origin.x = collectionViewOffset + sliderWidth * CGFloat(selectedIndex) + sliderWidth * (x - 1)
    }
    
    /// Used to move bottom slider to tab at index
    /// - Parameter index: tab index
    func slideTo(index: Int) {
        UIView.animate(withDuration: 0.2) {
            self.bottomSlider.frame.origin.x = self.collectionViewOffset + self.sliderWidth * CGFloat(index)
        }
    }

    func setSelected(atIndex index: Int) {
        selectedIndex = index

        // Reload tabs
        tabs.forEach {
            $0.isSelected = false
        }
        tabs[index].isSelected = true
        collectionView.reloadSections(IndexSet(integer: 0))
        collectionView.scrollToItem(
            at: IndexPath(row: index, section: 0),
            at: .centeredHorizontally,
            animated: true
        )
    }
}

// MARK: - UICollectionViewDelegate

extension TabsView: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        delegate?.tabsViewDelegate(didSelectItemAtIndex: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TabsView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: sliderWidth, height: Style.tabsHeight)
    }
}

// MARK: - UIScrollViewDelegate

extension TabsView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionViewOffset = -scrollView.contentOffset.x
        updateSliderPosition(x: 1.0)
    }
}

// MARK: - UICollectionViewDataSource

extension TabsView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        tabs.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let tab = tabs[indexPath.row]
        let cell: TabsCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(
            title: tab.title,
            isSelected: tab.isSelected
        )
        return cell
    }
}

// MARK: - Factory

private extension TabsView {
    func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = Style.colorBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TabsCell.self)
        return collectionView
    }
    
    func makeBottomSlider() -> UIView {
        let view = UIView()
        view.backgroundColor = Style.colorGreen
        return view
    }

    func makeSeparator() -> UIView {
        let view = UIView()
        view.backgroundColor = Style.colorQuaternary
        return view
    }
}
