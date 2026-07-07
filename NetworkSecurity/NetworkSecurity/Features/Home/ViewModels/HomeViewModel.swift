//
//  HomeViewModel.swift
//  NetworkSecurity
//
//  Created by Siddhatech on 07/07/26.
//

import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var user: User?
    @Published var statusMessage = "Press the button to fetch user."
    @Published var isLoading = false

    func fetchUser() {
        // We will implement this in the Networking section.
    }
}
