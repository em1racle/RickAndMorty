//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol, CoordinatorFinishDelegate {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    private let userDefaultsRepository: IUserDefaultsRepository
    var dependencies: IDependencies
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
        self.dependencies = dependencies
        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }
    
    func start() {
        showLaunchFlow()
    }
    
    func showLaunchFlow() {
        let launchCoordinator = LaunchCoordinator(navigationController, dependencies: dependencies)
        launchCoordinator.finishDelegate = self
        launchCoordinator.start()
        childCoordinators.append(launchCoordinator)
    }
    
    func showMainFlow() {
        let pageCoordinator = TabBarCoordinator(navigationController, dependencies: dependencies)
        pageCoordinator.finishDelegate = self
        pageCoordinator.start()
        childCoordinators.append(pageCoordinator)
    }
}

extension AppCoordinator {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .launch:
            showMainFlow()
        case .app, .tabBar:
            break
        }
    }
}
