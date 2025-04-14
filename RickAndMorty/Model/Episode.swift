//
//  Episode.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 13.04.2025.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
