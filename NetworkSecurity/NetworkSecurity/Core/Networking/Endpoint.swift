//
//  Endpoint.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

protocol Endpoint {

    var path: String { get }

    var method: HTTPMethod { get }

    var headers: [String: String] { get }

    var queryItems: [URLQueryItem]? { get }

    var body: Data? { get }
}

extension Endpoint {

    var headers: [String: String] {
        [:]
    }

    var queryItems: [URLQueryItem]? {
        nil
    }

    var body: Data? {
        nil
    }

    var url: URL? {

        var components = URLComponents(
            string: Constants.API.baseURL + path
        )

        components?.queryItems = queryItems

        return components?.url
    }
}
