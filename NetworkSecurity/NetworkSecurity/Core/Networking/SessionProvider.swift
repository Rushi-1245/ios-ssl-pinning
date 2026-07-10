//
//  SessionProvider.swift
//  NetworkSecurity
//
//  Created by Rushi on 09/07/26.
//

import Foundation

enum SessionProvider {

    static let shared: URLSession = {

        let configuration = URLSessionConfiguration.default

        let delegate = SSLPinningManager(
            strategy: .publicKey
        )
        
//        let delegate = SSLPinningManager(
//            strategy: .certificate
//        )

        return URLSession(
            configuration: configuration,
            delegate: delegate,
            delegateQueue: nil
        )

    }()
}
