//
//  CertificateLoader.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

enum CertificateLoader {

    static func loadCertificate() -> Data? {

        guard let url = Bundle.main.url(
            forResource: "server",
            withExtension: "der"
        ) else {

            print("❌ server.der not found in bundle")
            return nil
        }

        guard let data = try? Data(contentsOf: url) else {
            return nil
        }

        return data
    }
}
