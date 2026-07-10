//
//  SSLPinningManager.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation
import Security

final class SSLPinningManager: NSObject, URLSessionDelegate {
    
    private let validator: PinningValidator

    init(strategy: PinningStrategy = .certificate) {

        switch strategy {

        case .certificate:
            self.validator = CertificateValidator()

        case .publicKey:
            self.validator = PublicKeyValidator()
        }
    }

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

        if validator.validate(serverTrust: serverTrust) {

            let credential = URLCredential(trust: serverTrust)

            completionHandler(.useCredential, credential)

        } else {

            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
