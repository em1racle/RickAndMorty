//
//  HTTPClient.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import Moya
import Foundation

typealias HTTPResult = Result<Data, Error>
protocol IHTTPClient {
    func request()
}

