//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import UIKit

enum CoordinatorType {
    case app, launch, tabBar
}

protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    var dependencies: IDependencies { get }
    func start()
    func finish()
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
