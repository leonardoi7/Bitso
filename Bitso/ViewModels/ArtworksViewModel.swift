//
//  ArtworksViewModel.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import Foundation

class ArtworksViewModel: ObservableObject {
    @Published var artworks: [Data] = []
    @Published var isLoadingPage = false
    @Published var error: Error?
    
    private var currentPage = 1
    private var totalPages = 100
    private let preloadThreshold = 5
    private let networkService: NetworkServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    
    init(networkService: NetworkServiceProtocol, databaseService: DatabaseServiceProtocol) {
        self.networkService = networkService
        self.databaseService = databaseService
        loadCachedOrFetchArtworks()
    }
    
    func loadCachedOrFetchArtworks() {
        if let cachedArtworks = databaseService.loadArtworks(), !cachedArtworks.isEmpty {
            self.artworks = cachedArtworks
        } else {
            loadArtworks()
        }
    }
    
    func loadArtworks() {
        isLoadingPage = true
        networkService.fetchArtworks(page: currentPage, limit: 12) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoadingPage = false
                switch result {
                case .success(let newArtworks):
                    self.artworks.append(contentsOf: newArtworks.data ?? [])
                    newArtworks.data?.forEach { self.databaseService.saveArtwork(artworkData: $0) }
                    self.currentPage += 1
                    self.totalPages = newArtworks.pagination?.totalPages ?? 1
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
    func refreshArtworks() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.databaseService.clearDatabase()
            self.artworks = []
            self.currentPage = 1
            self.loadArtworks()
        }
    }
    
    func shouldPreloadNextPage(currentArtwork: Data) -> Bool {
        if let lastItem = artworks.last, lastItem == currentArtwork {
            return true
        } else if let thresholdItem = artworks.dropLast(preloadThreshold).last, thresholdItem == currentArtwork {
            return true
        }
        return false
    }
}


