//
//  Codable+Extension.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 06.04.2025.
//

import Foundation

extension Encodable {
    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
