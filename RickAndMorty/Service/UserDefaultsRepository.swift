//
//  UserDefaultsRepository.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import Foundation

protocol IUserDefaultsRepository {
    
}

final class UserDefaultsRepository: IUserDefaultsRepository {
    private let container: UserDefaults
    
    init(container: UserDefaults) {
        self.container = container
    }
}
