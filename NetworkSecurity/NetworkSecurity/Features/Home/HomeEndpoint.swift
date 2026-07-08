//
//  HomeEndpoint.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

enum HomeEndpoint {

    case fetchUser
}

extension HomeEndpoint: Endpoint {

    var path: String {

        switch self {

        case .fetchUser:
            return "/user"
        }
    }

    var method: HTTPMethod {

        switch self {

        case .fetchUser:
            return .get
        }
    }
}
