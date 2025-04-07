//
//  LaunchCoordinator.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import UIKit

protocol LaunchCoordinatorProtocol: Coordinator {
    func start()
}

final class LaunchCoordinator: LaunchCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: IDependencies
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showLaunchViewController()
    }
    
    func showLaunchViewController() {
        let launchViewController = LaunchAssembly.configure(dependencies)
        if let launchViewController = launchViewController as? LaunchViewController {
            launchViewController.didSendEventHandler = { [weak self] event in
                switch event {
                case .launchComplete:
                    self?.finish()
                }
            }
        }
        navigationController.show(launchViewController, sender: self)
    }
}
