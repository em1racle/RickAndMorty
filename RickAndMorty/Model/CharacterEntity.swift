//
//  CharacterEntity.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 13.04.2025.
//

import CoreData

extension CharacterEntity {
    @discardableResult
    static func make(context: NSManagedObjectContext, model: Character) -> CharacterEntity {
        let entity = CharacterEntity(context: context)
        entity.id = Int64(model.id)
        entity.characterName = model.name
        entity.status = model.status
        entity.species = model.species
        entity.type = model.type
        entity.gender = model.gender
        entity.originName = model.origin.name
        entity.originURL = model.origin.url
        entity.locationName = model.location.name
        entity.locationURL = model.location.url
        entity.image = model.image
        entity.characterEpisode = model.episode as NSArray
        return entity
    }
}
