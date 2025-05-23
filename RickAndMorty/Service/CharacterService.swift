//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 06.04.2025.
//

import Foundation

typealias CharacterResult = Result<Character, Error>
protocol ICharacterService {
    func getCharacter(completion: @escaping (CharacterResult) -> Void)
}

struct CharacterService: ICharacterService {
    private let networkService: IHTTPClient
    private let coreDataService: ICharacterCoreDataService
    init(_ dependencies: IDependencies) {
        networkService = dependencies.networkService
        coreDataService = dependencies.characterCoreDataService
    }
    func getCharacter(completion: @escaping (CharacterResult) -> Void) {
        coreDataService.fetch { result in
            switch result {
            case .success(let character):
                if let character = character {
                    OperationQueue.mainAsyncIfNeeded {
                        completion(.success(character))
                    }
                } else {
                    downloadCharacter(completion: completion)
                }
            case .failure:
                fatalError()
            }
        }
    }
}

extension CharacterService {
    private func downloadCharacter(completion: @escaping (CharacterResult) -> Void) {
        networkService.request(target: .characters) { result in
            let returnedResult: CharacterResult
            defer {
                OperationQueue.mainAsyncIfNeeded {
                    completion(returnedResult)
                }
            }
            switch result {
            case .success(let data):
                do {
                    let model = try data.decoded() as Character
                    returnedResult = .success(model)
                } catch let error {
                    returnedResult = .failure(error)
                }
            case .failure(let error):
                returnedResult = .failure(error)
            }
        }
    }
}
