//
//  SSLPinningManager.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

final class SSLPinningManager: NSObject, URLSessionDelegate {
    
    
    func urlSession(
        _ session: URLSession,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
    ) {

        guard challenge.protectionSpace.authenticationMethod ==
                NSURLAuthenticationMethodServerTrust else {

            completionHandler(.performDefaultHandling, nil)
            return
        }

        guard let serverTrust = challenge.protectionSpace.serverTrust else {

            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        print("✅ Server Trust Received")

        guard let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) else {

            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        print("✅ Server Certificate Found")

        let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data

        guard let pinnedCertificateData = CertificateLoader.loadCertificate() else {

            print("❌ Failed to load pinned certificate")

            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        print("📄 Pinned Certificate Size: \(pinnedCertificateData.count) bytes")

        if serverCertificateData == pinnedCertificateData {

            print("✅ Certificate Pinning Succeeded")

            let credential = URLCredential(trust: serverTrust)

            completionHandler(.useCredential, credential)

        } else {

            print("❌ Certificate Pinning Failed")

            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
