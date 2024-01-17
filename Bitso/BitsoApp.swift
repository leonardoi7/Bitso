//
//  BitsoApp.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import SwiftUI

@main
struct BitsoApp: App {
    let dependencies = AppDependencies()
    var networkService: NetworkServiceProtocol { dependencies.networkService }
    var databaseService: DatabaseServiceProtocol { dependencies.databaseService }
    var artworksViewModel: ArtworksViewModel { ArtworksViewModel(networkService: networkService, databaseService: databaseService) }

    var body: some Scene {
        WindowGroup {
            ArtworksView(viewModel: artworksViewModel)
                .environmentObject(dependencies)
        }
    }
}
