//
//  Environment.swift
//  NetworkSecurity
//
//  Created by Rushi on 11/07/26.
//

enum Environment {

    case development
    case staging
    case production

    var baseURL: String {

        switch self {

        case .development:
            return "https://10.46.98.254:3000"

        case .staging:
            return "https://staging.example.com"

        case .production:
            return "https://api.example.com"
        }
    }
}
