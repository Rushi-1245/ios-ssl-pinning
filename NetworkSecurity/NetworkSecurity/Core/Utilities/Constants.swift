//
//  Constants.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

enum Constants {

    enum API {

        static let environment: Environment = .development

        static var baseURL: String {
            environment.baseURL
        }
    }

    enum Security {

        static let pinningStrategy: PinningStrategy = .publicKey

        static let pinnedPublicKeyHashes = [
            "2851b6d49cfc5d50e89b5970176a6d96de8ce57cb4121c071dd69cd800a0a174"
        ]
    }
}
