//
//  NetworkService.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

protocol NetworkService {

    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T
}
