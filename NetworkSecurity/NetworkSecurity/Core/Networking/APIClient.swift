//
//  APIClient.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Foundation

final class APIClient: NetworkService {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T: Decodable>(
        _ endpoint: Endpoint,
        responseType: T.Type
    ) async throws -> T {

        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)

        request.httpMethod = endpoint.method.rawValue

        request.httpBody = endpoint.body

        endpoint.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        do {

            let (data, response) = try await session.data(for: request)
            
            print("🌍 URL:", request.url?.absoluteString ?? "")
            print("📦 Response:", response)

            if let json = String(data: data, encoding: .utf8) {
                print("📄 JSON:")
                print(json)
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidStatusCode(httpResponse.statusCode)
            }

            do {

                return try JSONDecoder().decode(
                    T.self,
                    from: data
                )

            } catch {

                throw NetworkError.decodingFailed
            }

        } catch let error as URLError {

            switch error.code {

            case .notConnectedToInternet:
                throw NetworkError.noInternet

            default:
                throw NetworkError.unknown(error)
            }

        } catch {

            throw NetworkError.unknown(error)
        }
    }
}
