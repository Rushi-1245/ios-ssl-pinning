//
//  SSLPinningError.swift
//  NetworkSecurity
//
//  Created by Rushi on 11/07/26.
//

import Foundation

enum SSLPinningError: LocalizedError {

    case serverTrustUnavailable
    case serverCertificateUnavailable
    case publicKeyExtractionFailed
    case publicKeyDataExtractionFailed
    case certificateValidationFailed
    case publicKeyValidationFailed

    var errorDescription: String? {

        switch self {

        case .serverTrustUnavailable:
            return "Unable to retrieve the server trust."

        case .serverCertificateUnavailable:
            return "Unable to retrieve the server certificate."

        case .publicKeyExtractionFailed:
            return "Unable to extract the server public key."

        case .publicKeyDataExtractionFailed:
            return "Unable to extract public key data."

        case .certificateValidationFailed:
            return "Certificate pinning validation failed."

        case .publicKeyValidationFailed:
            return "Public key pinning validation failed."
        }
    }
}
