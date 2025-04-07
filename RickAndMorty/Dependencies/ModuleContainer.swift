//
//  ModuleContainer.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import UIKit

protocol IModuleContainer {
    func getLaunchView() -> UIViewController
    func getTabBarView() -> UIViewController
    func getCharactersView() -> UIViewController
    func getFavouritesView() -> UIViewController
}

final class ModuleContainer: IModuleContainer {
    private let dependencies: IDependencies
    required init(_ dependencies: IDependencies) {
        self.dependencies = dependencies
    }
}

extension ModuleContainer {
    func getTabBarView() -> UIViewController {
        let charactersVC = CharactersAssembly.configure(dependencies)
        let favouritesVC = FavouritesAssembly.configure(dependencies)
        let view = TabBarViewController(controllers: [charactersVC, favouritesVC])
        view.controllers = [charactersVC, favouritesVC]
        view.startIndex = 0
        return view
    }
}

extension ModuleContainer {
    func getLaunchView() -> UIViewController {
        return LaunchViewController()
    }
}

extension ModuleContainer {
    func getCharactersView() -> UIViewController {
        return CharactersViewController()
    }
}

extension ModuleContainer {
    func getFavouritesView() -> UIViewController {
        return FavouritesViewController()
    }
}
