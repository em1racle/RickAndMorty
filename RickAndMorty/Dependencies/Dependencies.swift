//
//  Dependencies.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import Foundation

protocol IDependencies {
    var moduleContainer: IModuleContainer { get }
    var userDefaultsRepository: IUserDefaultsRepository { get }
    var networkService: IHTTPClient { get }
    var characterService: ICharacterService { get }
    var characterCoreDataService: ICharacterCoreDataService { get }
}

final class Dependencies: IDependencies {
    lazy var moduleContainer: IModuleContainer = ModuleContainer(self)
    lazy var userDefaultsRepository: IUserDefaultsRepository = UserDefaultsRepository(container: UserDefaults.standard)
    lazy var networkService: IHTTPClient = HTTPClient()
    lazy var characterService: ICharacterService = CharacterService(self)
    lazy var characterCoreDataService: ICharacterCoreDataService = CharacterCoreDataService()
}

final class DependenciesMock: IDependencies {
    lazy var moduleContainer: IModuleContainer = ModuleContainer(self)
    lazy var userDefaultsRepository: IUserDefaultsRepository = UserDefaultsRepository(container: UserDefaults.standard)
    lazy var networkService: IHTTPClient = HTTPClient()
    lazy var characterService: ICharacterService = CharacterService(self)
    lazy var characterCoreDataService: ICharacterCoreDataService = CharacterCoreDataService()
}
