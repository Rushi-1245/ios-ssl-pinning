//
//  NetworkError.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

enum NetworkError: LocalizedError {

    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingFailed
    case noInternet
    case unknown(Error)

    var errorDescription: String? {

        switch self {

        case .invalidURL:
            return "Invalid URL."

        case .invalidResponse:
            return "Invalid server response."

        case .invalidStatusCode(let code):
            return "Request failed with status code \(code)."

        case .decodingFailed:
            return "Failed to decode server response."

        case .noInternet:
            return "No internet connection."

        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
