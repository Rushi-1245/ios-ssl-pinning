//
//  CertificateValidator.swift
//  NetworkSecurity
//
//  Created by Rushi on 09/07/26.
//

import Foundation
import Security

final class CertificateValidator: PinningValidator {

    func validate(serverTrust: SecTrust) -> Bool {

        guard let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) else {

            print(SSLPinningError.serverCertificateUnavailable.localizedDescription)
            return false
        }

        let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data

        guard let pinnedCertificateData = CertificateLoader.loadCertificate() else {

            print("❌ Failed to load pinned certificate")
            return false
        }

        let isValid = serverCertificateData == pinnedCertificateData

        print(isValid ? "✅ Certificate Pinning Succeeded" : SSLPinningError.certificateValidationFailed.localizedDescription)

        return isValid
    }
}
