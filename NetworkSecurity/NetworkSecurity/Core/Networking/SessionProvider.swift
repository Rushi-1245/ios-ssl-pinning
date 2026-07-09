//
//  SessionProvider.swift
//  NetworkSecurity
//
//  Created by Siddhatech on 09/07/26.
//

import Foundation

enum SessionProvider {

    static let shared: URLSession = {

        let configuration = URLSessionConfiguration.default

        let delegate = SSLPinningManager()

        return URLSession(
            configuration: configuration,
            delegate: delegate,
            delegateQueue: nil
        )

    }()
}
