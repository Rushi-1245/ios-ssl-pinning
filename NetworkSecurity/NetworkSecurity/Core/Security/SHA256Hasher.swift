//
//  SHA256Hasher.swift
//  NetworkSecurity
//
//  Created by Rushi on 10/07/26.
//

import Foundation
import CryptoKit

enum SHA256Hasher {

    static func hash(data: Data) -> String {

        let digest = SHA256.hash(data: data)

        return digest.map {
            String(format: "%02x", $0)
        }.joined()
    }
}
