//
//  PublicKeyValidator.swift
//  NetworkSecurity
//
//  Created by Rushi on 10/07/26.
//

import Foundation
import Security

import Foundation
import Security

final class PublicKeyValidator: PinningValidator {

    func validate(serverTrust: SecTrust) -> Bool {

        guard let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) else {

            print("❌ Failed to get server certificate")
            return false
        }

        guard let serverPublicKey = SecCertificateCopyKey(serverCertificate) else {

            print("❌ Failed to extract server public key")
            return false
        }

        var error: Unmanaged<CFError>?

        guard let serverPublicKeyData = SecKeyCopyExternalRepresentation(
            serverPublicKey,
            &error
        ) as Data? else {

            print("❌ Failed to get public key data")

            if let error {
                print(error.takeRetainedValue())
            }

            return false
        }

        let publicKeyHash = SHA256Hasher.hash(data: serverPublicKeyData)

        print("🔑 Server Public Key Hash:")
        print(publicKeyHash)

        let isValid = publicKeyHash == Constants.Security.pinnedPublicKeyHash

        print(
            isValid
            ? "✅ Public Key Pinning Succeeded"
            : "❌ Public Key Pinning Failed"
        )

        return isValid
    }
}
