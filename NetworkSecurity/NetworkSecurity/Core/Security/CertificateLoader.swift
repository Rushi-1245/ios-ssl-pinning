//
//  CertificateLoader.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

enum CertificateLoader {

    static func loadCertificate() throws -> Data {

        guard let url = Bundle.main.url(
            forResource: "server",
            withExtension: "crt"
        ) else {
            throw NSError(domain: "Certificate", code: 1)
        }

        return try Data(contentsOf: url)
    }
}
