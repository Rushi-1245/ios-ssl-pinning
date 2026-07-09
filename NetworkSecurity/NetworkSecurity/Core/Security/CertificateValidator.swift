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

            print("❌ Failed to get server certificate")
            return false
        }

        let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data

        guard let pinnedCertificateData = CertificateLoader.loadCertificate() else {

            print("❌ Failed to load pinned certificate")
            return false
        }

        let isValid = serverCertificateData == pinnedCertificateData

        print(isValid
              ? "✅ Certificate Pinning Succeeded"
              : "❌ Certificate Pinning Failed")

        return isValid
    }
}
