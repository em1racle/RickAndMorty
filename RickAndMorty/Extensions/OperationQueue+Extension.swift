//
//  OperationQueue+Extension.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 06.04.2025.
//

import UIKit

protocol OperationQueueBehavioral {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void)
}

extension OperationQueue: OperationQueueBehavioral {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            main.addOperation(work)
        }
    }
}
