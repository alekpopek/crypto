//
//  TabPageViewController.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

final class TabPageViewController: ViewController<TabPageView, TabPageViewModel> {
    
    private(set) lazy var pageViewController: UIPageViewController = makePageViewController()
        
    var viewControllers: [UIViewController] = [] {
        didSet {
            configureViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
}

// MARK: - UIPageViewControllerDataSource

extension TabPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let indexBefore = index - 1
        if indexBefore < 0 {
            return nil
        }
        return viewControllers[indexBefore]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let indexAfter = index + 1
        if indexAfter >= viewControllers.count {
            return nil
        }
        return viewControllers[indexAfter]
    }
}

// MARK: - UIPageViewControllerDelegate

extension TabPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let currentViewController = pageViewController.viewControllers?.first, let index = viewControllers.firstIndex(of: currentViewController) {
            viewModel.selectedIndex = index
            contentView.tabsView.setSelected(atIndex: viewModel.selectedIndex)
        }
    }
}

// MARK: - UIScrollViewDelegate

extension TabPageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard viewModel.shouldScroll else { return }
        let offset: CGFloat = scrollView.contentOffset.x
        if scrollView.frame.width.truncatingRemainder(dividingBy: offset) != 0 {
            contentView.tabsView.updateSliderPosition(x: offset / scrollView.frame.width)
        }
    }
}

// MARK: - TabsViewDelegate

extension TabPageViewController: TabsViewDelegate {
    func tabsViewDelegate(didSelectItemAtIndex index: Int) {
        guard
            let viewController = viewControllers[safe: index],
            index != viewModel.selectedIndex
        else {
            return
        }
        let direction: UIPageViewController.NavigationDirection = index < viewModel.selectedIndex
            ? .reverse
            : .forward
        viewModel.shouldScroll = false
        contentView.tabsView.slideTo(index: index)
        contentView.tabsView.setSelected(atIndex: index)
        pageViewController.setViewControllers(
            [viewController],
            direction: direction,
            animated: true,
            completion: { _ in
                self.viewModel.shouldScroll = true
                self.viewModel.selectedIndex = index
            }
        )
    }
}


// MARK: - Setup

private extension TabPageViewController {
    func setupViews() {
        addChild(pageViewController)
        contentView.mainView.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        for subView in pageViewController.view.subviews {
            guard let subView = subView as? UIScrollView else { return }
            subView.delegate = self
        }
        
        contentView.tabsView.delegate = self
    }
    
    func setupConstraints() {
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureViews() {
        guard let viewController = viewControllers.first else {
            return
        }
        // Configure PageViewController
        pageViewController.setViewControllers(
            [viewController],
            direction: .forward,
            animated: false,
            completion: nil
        )
        
        // Configure TabsView
        let tabs: [Tab] = viewControllers.map {
            Tab(title: $0.title ?? "No title")
        }
        tabs[viewModel.selectedIndex].isSelected = true
        contentView.tabsView.configure(withTabs: tabs)
    }
}

// MARK: - Factory

private extension TabPageViewController {
    func makePageViewController() -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
        pageViewController.dataSource = self
        pageViewController.delegate = self
        return pageViewController
    }
}
