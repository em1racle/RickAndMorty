//
//  CharacterCoreDataService.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 09.04.2025.
//

import CoreData

typealias CharacterCoreDataResult = Result<Character?, CoreDataError>
protocol ICharacterCoreDataService {
    func fetch(completion: @escaping (CharacterCoreDataResult) -> Void)
    func update(character: Character)
}

final class CharacterCoreDataService: ICharacterCoreDataService {
    private let container: NSPersistentContainer
    private let containerName: String = CoreDataConstant.characterContainerName
    private let entityName: String = CoreDataConstant.characterEntityName
    private var savedEntities: [CharacterEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                Log.error("\(CoreDataError.errorLoading(error))")
            }
        }
    }
    func fetch(completion: @escaping (CharacterCoreDataResult) -> Void) {
        let request = NSFetchRequest<CharacterEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
            if savedEntities.isNotEmpty {
                completion(.success(Character(savedEntities[0])))
            } else {
                completion(.success(nil))
            }
        } catch let error {
            completion(.failure(.errorFetching(error)))
        }
    }
    
    func update(character: Character) {
        if let entity = savedEntities.first(where: { $0.characterName == character.name }) {
            delete(entity: entity)
        }
        add(character: character)
    }
    
    private func add(character: Character) {
        CharacterEntity.make(context: container.viewContext, model: character)
        applyChanges()
    }
    
    private func delete(entity: CharacterEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            Log.error("\(CoreDataError.errorSaving(error))")
        }
    }
    
    private func applyChanges() {
        save()
        fetch { _ in }
    }
}
