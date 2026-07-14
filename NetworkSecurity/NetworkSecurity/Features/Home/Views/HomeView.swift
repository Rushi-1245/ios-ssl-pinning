//
//  HomeView.swift
//  NetworkSecurity
//
//  Created by Rushi on 07/07/26.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel: HomeViewModel

    init() {
        _viewModel = StateObject(
            wrappedValue: HomeViewModel(
                networkService: APIClient()
            )
        )
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                Text("Network Security")
                    .font(.largeTitle.bold())

                Text("SSL Pinning Demo")
                    .font(.title3)
                    .foregroundStyle(.secondary)

                // MARK: - Active Security Configuration

                VStack(alignment: .leading, spacing: 12) {

                    Label("Active Security Configuration", systemImage: "lock.shield.fill")
                        .font(.headline)

                    HStack {

                        Text("Pinning Strategy")

                        Spacer()

                        Text(Constants.Security.pinningStrategy.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                    }

                    Divider()

                    HStack {

                        Text("Environment")

                        Spacer()

                        Text(Constants.API.environment.title)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))

                Button {
                    viewModel.fetchUser()
                } label: {
                    Text("Fetch User")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                VStack(alignment: .leading, spacing: 12) {

                    Text("Status")
                        .font(.headline)

                    Text(viewModel.statusMessage)
                        .foregroundStyle(.secondary)

                    Divider()

                    if let user = viewModel.user {

                        Text("Name")
                            .font(.headline)

                        Text(user.name)

                        Divider()

                        Text("Balance")
                            .font(.headline)

                        Text("₹\(user.balance.formatted())")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
