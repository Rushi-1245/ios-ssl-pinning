//
//  PinningStrategy.swift
//  NetworkSecurity
//
//  Created by Rushi on 10/07/26.
//

/// Represents the available SSL pinning strategies.
enum PinningStrategy {

    case certificate
    case publicKey
}

extension PinningStrategy {

    var title: String {

        switch self {

        case .certificate:
            return "Certificate Pinning"

        case .publicKey:
            return "Public Key Pinning"
        }
    }
}
