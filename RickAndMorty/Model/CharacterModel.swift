//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 06.04.2025.
//

struct CharacterListResponse: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    
    struct Origin: Codable {
        let name: String
        let url: String
    }
    
    struct Location: Codable {
        let name: String
        let url: String
    }
}
