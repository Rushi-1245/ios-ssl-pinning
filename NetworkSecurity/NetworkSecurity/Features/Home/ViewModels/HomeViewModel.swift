//
//  HomeViewModel.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import Combine
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var user: User?
    @Published var statusMessage = "Press the button to fetch user."
    @Published var isLoading = false

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchUser() {

        Task {

            isLoading = true
            statusMessage = "🟡 Loading..."

            defer {
                isLoading = false
            }

            do {

                let user = try await networkService.request(
                    HomeEndpoint.fetchUser,
                    responseType: User.self
                )

                self.user = user
                statusMessage = "🟢 User loaded successfully."

            } catch {

                statusMessage = error.localizedDescription
            }
        }
    }
}
