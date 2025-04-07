//
//  TabBarViewController.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    enum Event {
        case tabChanged
    }
    var didSendEventHandler: ((TabBarViewController.Event) -> Void)?
    var controllers: [UIViewController] = [] {
        didSet {
            setupViewControllers()
        }
    }
    var startIndex = 0
    
    init(controllers: [UIViewController]) {
            guard controllers.count == 2 else {
                fatalError("TabBarViewController requires exactly 2 view controllers")
            }
            self.controllers = controllers
            super.init(nibName: nil, bundle: nil)
        }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupUI()
        setupViewControllers()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupViewControllers() {
        let charactersVC = controllers[0]
        charactersVC.tabBarItem = UITabBarItem(title: "Characters",
                                               image: UIImage(systemName: "person.3"),
                                               tag: 0)
        
        let favouritesVC = controllers[1]
        favouritesVC.tabBarItem = UITabBarItem(title: "Favorites",
                                               image: UIImage(systemName: "heart"),
                                               tag: 1)
        
        viewControllers = [charactersVC, favouritesVC]
        selectedIndex = startIndex
    }
}

// MARK: - UITabBarControllerDelegate
extension TabBarViewController {
    func tabBarController(_ tabBarController: UITabBarController,
                         didSelect viewController: UIViewController) {
        didSendEventHandler?(.tabChanged)
    }
}

// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TabBarViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let dependency = DependenciesMock()
        let viewController = TabBarAssembly.configure(dependency)
        Group {
            PreviewViewController(viewController)
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Light")
            PreviewViewController(viewController)
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Dark")
                .preferredColorScheme(.dark)
        }
    }
}
#endif
