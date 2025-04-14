//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 13.04.2025.
//

import Foundation

protocol CharacterCellViewModelProtocol {
    var updateCharacterHandler: ((Character) -> Void)? { get set }
    func getCharacter()
}

final class CharacterCellViewModel: CharacterCellViewModelProtocol {
    var updateCharacterHandler: ((Character) -> Void)?
    private var characterService: ICharacterService?
    private var character: Character?
    init(_ dependencies: IDependencies) {
        characterService = dependencies.characterService
    }
    func getCharacter() {
        characterService?.getCharacter(completion: { result in
            switch result {
            case .success(let character):
                self.character = character
                self.updateCharacterHandler?(character)
            case .failure(let error):
                Log.error(error.localizedDescription)
            }
        })
    }
}
