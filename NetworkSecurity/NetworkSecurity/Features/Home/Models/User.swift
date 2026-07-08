//
//  User.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let balance: Double
}
