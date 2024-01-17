//
//  ArtworksViewModel.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import Foundation

class ArtworksViewModel: ObservableObject {
    @Published var artworks: Artworks?
    private let networkService: NetworkServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    
    init(networkService: NetworkServiceProtocol, databaseService: DatabaseServiceProtocol) {
        self.networkService = networkService
        self.databaseService = databaseService
        loadArtworks()
    }
    
    func loadArtworks() {
        if let cachedData = databaseService.loadArtworks() {
            artworks = Artworks(data: cachedData)
            return
        }
        
        networkService.fetchArtworks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let artworks):
                    self?.artworks = artworks
                    artworks.data?.forEach { artworkData in
                        self?.databaseService.saveArtwork(artworkData: artworkData)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

