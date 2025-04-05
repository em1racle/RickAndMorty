//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import Moya
import Foundation

enum RMEndpoint {
    case character
    case episode
}

extension RMEndpoint: TargetType {
    var baseURL: URL {
        guard let url = URL(string: API.baseUrl) else { fatalError() }
        return url
    }
    var path: String {
        switch self {
        case .character: return "/characters"
        case .episode: return "/episode"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
        case .character, .episode:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
