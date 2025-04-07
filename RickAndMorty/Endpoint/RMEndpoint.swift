//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import Moya
import Foundation

enum RMEndpoint {
    case characters
    case episodes
}

extension RMEndpoint: TargetType {
    var baseURL: URL {
        guard let url = URL(string: API.baseUrl) else { fatalError() }
        return url
    }
    var path: String {
        switch self {
        case .characters: return "/character"
        case .episodes: return "/episode"
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
        case .characters, .episodes:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
